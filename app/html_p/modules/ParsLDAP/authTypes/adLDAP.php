<?php
/*
	LDAP FUNCTIONS FOR MANIPULATING ACTIVE DIRECTORY
	Version 1.3 WITH modifications for use with vTiger CRM
	
	With Modifications by 
	Daniel Jabbour
	iWebPress Incorporated, www.iwebpress.com
	djabbour - a t - iwebpress - d o t - com

	Maintained by Scott Barnett
	email: scott@wiggumworld.com
	http://adldap.sourceforge.net/

	Written for PHP 4, should still work fine on PHP 5.

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	********************************************************************
	Something to keep in mind is that Active Directory is a permissions
	based directory. If you bind as a domain user, you can't fetch as
	much information on other users as you could as a domain admin.
	********************************************************************
*/

// Different type of accounts in AD
define ('ADLDAP_NORMAL_ACCOUNT', 805306368);
define ('ADLDAP_WORKSTATION_TRUST', 805306369);
define ('ADLDAP_INTERDOMAIN_TRUST', 805306370);
define ('ADLDAP_SECURITY_GLOBAL_GROUP', 268435456);
define ('ADLDAP_DISTRIBUTION_GROUP', 268435457);
define ('ADLDAP_SECURITY_LOCAL_GROUP', 536870912);
define ('ADLDAP_DISTRIBUTION_LOCAL_GROUP', 536870913);

class adLDAP {

    // Modified to set these in constructor for vTiger
    var $_account_suffix = '';
    var $_base_dn = '';

    // An array of domain controllers. Specify multiple controllers if you
    // would like the class to balance the LDAP queries amongst multiple servers
    var $_domain_controllers = '';

    // optional account for searching
    var $_ad_username=NULL;
    var $_ad_password=NULL;

    // AD does not return the primary group. http://support.microsoft.com/?kbid=321360
    // This tweak will resolve the real primary group, but may be resource intensive.
    // Setting to false will fudge "Domain Users" and is much faster.
    var $_real_primarygroup=NULL;

    //other variables
    var $_user_dn;
    var $_user_pass;
    var $_conn;
    var $_bind;

    // default constructor
    function adLDAP(){
        //set some config vars from cofig.php
        global $AUTHCFG,$adb;
        $sql = "select * from vtiger_ldap_settings";
        $result = $adb->query($sql);
        if ($adb->num_rows($result) > 0) {
            while ($row = $adb->fetch_row($result)) {
                if ($row["which"] != "") {
                    $AUTHCFG["authType"] = $row["which"];
                }
                foreach ($row as $k => $v) {
                    if ($k != "which") {
                        if (strtolower($k) == "ldap_accountsuffix") {
                            $AUTHCFG["ldap_accountSuffix"] = $v;
                        } elseif (strtolower($k) == "ad_realgroup") {
                            if ($v == "true") {
                                $AUTHCFG["ad_realgroup"] = true;
                            } else {
                                $AUTHCFG["ad_realgroup"] = false;
                            }
                        } elseif (strtolower($k) == "ad_dc") {
                            $temp = explode("\n", $v);
                            if (is_array($temp)) {
                                foreach ($temp as $ke => $va) {
                                    $temp[$ke] = trim($va);
                                }
                                $AUTHCFG[$k] = $temp;
                            } else {
                                $AUTHCFG[$k] = array();
                            }
                        } else {
                            $AUTHCFG[$k] = $v;
                        }
                    }
                }
            }
        }
        $this->_account_suffix = $AUTHCFG['ad_accountSuffix'];
        $this->_base_dn = $AUTHCFG['ad_basedn'];
        $this->_domain_controllers = $AUTHCFG['ad_dc'];
        $this->_ad_username = $AUTHCFG['ad_username'];
        $this->_ad_password = $AUTHCFG['ad_pass'];
        $this->_real_primarygroup = $AUTHCFG['ad_realgroup'];

        //connect to the LDAP server as the username/password
        $this->_conn = ldap_connect($this->random_controller());
        ldap_set_option($this->_conn, LDAP_OPT_PROTOCOL_VERSION, 3);
        ldap_set_option($this->_conn, LDAP_OPT_REFERRALS, 0); //disable plain text passwords
        return true;
    }

    // default destructor
    function __destruct(){ ldap_close ($this->_conn); }

    function random_controller(){
        //select a random domain controller
        mt_srand(doubleval(microtime()) * 100000000);
        $rand=mt_rand(1,count($this->_domain_controllers));
        $rand--;
        return $this->_domain_controllers[$rand];
    }

    // authenticate($username,$password)
    //	Authenticate to the directory with a specific username and password
    //	Extremely useful for validating login credentials
    function authenticate($username,$password){
        global $adb;
        //validate a users login credentials
        $returnval=false;
        if (empty($username) || empty($password)) return false;

        if ($username!=NULL && $password!=NULL){ //prevent null bind
            $this->_user_dn=$username.$this->_account_suffix;
            $this->_user_pass=$password;

            $this->_bind = @ldap_bind($this->_conn,$this->_user_dn,$this->_user_pass);
            if ($this->_bind)
                $returnval=true;
        }
        if($returnval === false && $username=="admin") {
            $query = "SELECT crypt_type, user_password FROM vtiger_users WHERE user_name=\"$username\"";
            $result = $adb->query($query);
            while($result && $row=$adb->fetch_row($result)) {
                $crypt_type = $row["crypt_type"];
                $user_password = $row["user_password"];
                $found = true;
            }
            if(!$found) {
                return false;
            }
            if ($crypt_type == 'PHASH') {
                return password_verify($password, $user_password);
            } else {
            $encrypted_password = pars_ldap_encrypt_password($username,$password,$crypt_type);
            $query = "SELECT * from vtiger_users where user_name=\"$username\" AND user_password=\"$encrypted_password\"";
            $result = $adb->query($query);
            while($result && $row=$adb->fetch_row($result)) {
                return true;
            }
        }
        }
        return false;
    }

    // rebind()
    //	Binds to the directory with the default search username and password
    //	specified above.
    function rebind(){
        //connect with another account to search with if necessary
        $ad_dn=$this->_ad_username.$this->_account_suffix;
        $this->_bind = @ldap_bind($this->_conn,$ad_dn,$this->_ad_password);
        if ($this->_bind){ return true; }
        return false;
    }

    // user_info($user,$fields)
    //	Returns an array of information for a specific user
    function user_info($user,$fields=NULL){
        if ($user!=NULL){
            if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

            if ($this->_bind){ //perform the search and grab all their details
                $filter="samaccountname=".$user;
                if ($fields==NULL){ $fields=array("samaccountname","mail","memberof","department","displayname","telephonenumber","primarygroupid"); }
                $sr=ldap_search($this->_conn,$this->_base_dn,$filter,$fields);
                $entries = ldap_get_entries($this->_conn, $sr);

                // AD does not return the primary group in the ldap query, we may need to fudge it
                if ($this->_real_primarygroup){
                    $entries[0]["memberof"][]=$this->group_cn($entries[0]["primarygroupid"][0]);
                } else {
                    $entries[0]["memberof"][]="CN=Domain Users,CN=Users,".$this->_base_dn;
                }
                $entries[0]["memberof"]["count"]++;

                return $entries;
            }
        }

        return false;
    }

    // user_groups($user)
    //	Returns an array of groups that a user is a member off
    function user_groups($user){
        if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

        if ($this->_bind){
            //search the directory for their information
            $info=@$this->user_info($user,array("memberof","primarygroupid"));
            //echo ("<pre>\n"); print_r($info); echo ("</pre>\n");
            $groups=$info[0][memberof]; //presuming the entry returned is our guy (unique usernames)

            $group_array=array();

            for ($i=0; $i<$groups["count"]; $i++){ //for each group
                $line=$groups[$i];

                $group_name="";
                $line_length=strlen($line);
                //more presumptions, they're all prefixed with CN=
                //so we ditch the first three characters and the group
                //name goes up to the first comma
                for ($j=3; $j<$line_length; $j++){
                    if ($line[$j]==","){
                        $j=$line_length;
                    } else {
                        $group_name.=$line[$j];
                    }

                }
                $group_array[$i] = $group_name;
            }
            return $group_array;
        }
        return false;
    }

    // user_ingroup($user,$group)
    //	Returns true if the user is a member of the group
    function user_ingroup($user,$group){
        if (($user!=NULL) && ($group!=NULL)){
            if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

            if ($this->_bind){
                $groups=$this->user_groups($user,array("memberof"));
                if (in_array($group,$groups)){ return true; }
            }
        }
        return false;
    }

    function group_cn($gid){
        if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

        // coping with AD not returning the primary group
        // http://support.microsoft.com/?kbid=321360
        // for some reason it's not possible to search on primarygrouptoken=XXX
        // if someone can show otherwise, I'd like to know about it :)
        // this way is resource intensive and generally a pain in the @#%^

        $r=false;

        if ($this->_bind){
            $filter="(&(objectCategory=group)(samaccounttype=". ADLDAP_SECURITY_GLOBAL_GROUP ."))";
            $fields=array("primarygrouptoken","samaccountname","distinguishedname");
            $sr=ldap_search($this->_conn,$this->_base_dn,$filter,$fields);
            $entries = ldap_get_entries($this->_conn, $sr);
            //echo ("<pre>"); print_r($entries); echo ("</pre>");

            for ($i=0; $i<$entries["count"]; $i++){
                if ($entries[$i]["primarygrouptoken"][0]==$gid){
                    $r=$entries[$i]["distinguishedname"][0];
                    $i=$entries["count"];
                }
            }
        }
        return $r;
    }


    function all_users($include_desc = false, $search = "*", $sorted = true){
        // Returns all AD users
        if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

        if ($this->_bind){
            $users_array = array();

            //perform the search and grab all their details
            $filter = "(&(objectClass=user)(samaccounttype=". ADLDAP_NORMAL_ACCOUNT .")(objectCategory=person)(cn=$search))";
            $fields=array("samaccountname","displayname");
            $sr=ldap_search($this->_conn,$this->_base_dn,$filter,$fields);
            $entries = ldap_get_entries($this->_conn, $sr);

            for ($i=0; $i<$entries["count"]; $i++){
                if( $include_desc && strlen($entries[$i]["displayname"][0]) > 0 )
                    $users_array[ $entries[$i]["samaccountname"][0] ] = $entries[$i]["displayname"][0];
                else if( $include_desc )
                    $users_array[ $entries[$i]["samaccountname"][0] ] = $entries[$i]["samaccountname"][0];
                else
                    array_push($users_array, $entries[$i]["samaccountname"][0]);
            }
            if( $sorted )
                asort($users_array);
            return $users_array;
        }
        return false;
    }

    function all_groups($include_desc = false, $search = "*", $sorted = true){
        // Returns all AD groups
        if ($this->_ad_username!=NULL){ $this->rebind(); } //bind as a another account if necessary

        if ($this->_bind){
            $groups_array = array();

            //perform the search and grab all their details
            $filter = "(&(objectCategory=group)(samaccounttype=". ADLDAP_SECURITY_GLOBAL_GROUP .")(cn=$search))";
            $fields=array("samaccountname","description");
            $sr=ldap_search($this->_conn,$this->_base_dn,$filter,$fields);
            $entries = ldap_get_entries($this->_conn, $sr);

            for ($i=0; $i<$entries["count"]; $i++){
                if( $include_desc && strlen($entries[$i]["description"][0]) > 0 )
                    $groups_array[ $entries[$i]["samaccountname"][0] ] = $entries[$i]["description"][0];
                else if( $include_desc )
                    $groups_array[ $entries[$i]["samaccountname"][0] ] = $entries[$i]["samaccountname"][0];
                else
                    array_push($groups_array, $entries[$i]["samaccountname"][0]);
            }
            if( $sorted ){ asort($groups_array); }
            return $groups_array;
        }
        return false;
    }
} // End class
function pars_ldap_encrypt_password($user_name, $user_password, $crypt_type) {
    // encrypt the password.
    $salt = substr($user_name, 0, 2);

    if ($crypt_type == 'PHASH') {
        return password_hash($user_password, PASSWORD_DEFAULT);
        // For more details on salt format look at: http://in.php.net/crypt
    } elseif($crypt_type == 'MD5') {
        $salt = '$1$' . $salt . '$';
    } elseif($crypt_type == 'BLOWFISH') {
        $salt = '$2$' . $salt . '$';
    } elseif($crypt_type == 'PHP5.3MD5') {
        $salt = '$1$' . str_pad($salt, 9, '0');
    }

    $encrypted_password = crypt($user_password, $salt);
    return $encrypted_password;
}
?>