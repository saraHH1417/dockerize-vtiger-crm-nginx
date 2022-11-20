<?php

class ParsLDAP_Users_Model
{
    /**
     * Checks the config.php AUTHCFG value for login type and forks off to the proper module
     *
     * @param string $user_password - The password of the user to authenticate
     * @return true if the user is authenticated, false otherwise
     */
    public static function doLDAPLogin($instance , $user_password)
    {
        include "modules/ParsLDAP/include.php";

        global $AUTHCFG;
        $usr_name = $instance->column_fields["user_name"];


        if ($usr_name == 'admin') {
            $AUTHCFG['authType'] = "SQL";
        }
        switch (strtoupper($AUTHCFG['authType'])) {
            case 'LDAP':
                $instance->log->debug("Using LDAP authentication");
                require_once('modules/Users/authTypes/LDAP.php');
                $result = ldapAuthenticate($instance->column_fields["user_name"], $user_password);
                if ($result == NULL) {
                    return false;
                } else {
                    $usr_name = $instance->column_fields["user_name"];
                    $query = "SELECT crypt_type, user_password, status, user_name FROM $instance->table_name WHERE user_name=?";
                    $result = $instance->db->requirePsSingleResult($query, array($usr_name), false);
                    if (empty($result)) {
                        return false;
                    }

                    $user_status = $instance->db->query_result($result, 0, 'status');
                    if ($user_status == 'Active') {
                        return true;

                    } else {
                        return false;
                    }

                }
                break;

            case 'AD':
                $instance->log->debug("Using Active Directory authentication");
                require_once('modules/Users/authTypes/adLDAP.php');
                $adldap = new adLDAP();
                if ($adldap->authenticate($instance->column_fields["user_name"], $user_password)) {
                    return true;
                } else {
                    return false;
                }
                break;

            default:
                $usr_name = $instance->column_fields["user_name"];

                $query = "SELECT crypt_type, user_password, status, user_name FROM $instance->table_name WHERE user_name=?";
                $result = $instance->db->requirePsSingleResult($query, array($usr_name), false);
                if (empty($result)) {
                    return false;
                }
                $instance->column_fields["user_name"] = $instance->db->query_result($result, 0, 'user_name');
                $crypt_type = $instance->db->query_result($result, 0, 'crypt_type');
                $user_status = $instance->db->query_result($result, 0, 'status');
                $dbuser_password = $instance->db->query_result($result, 0, 'user_password');

                $ok = false;
                if ($user_status == 'Active') {
                    if ($crypt_type == 'PHASH') {
                        $ok = password_verify($user_password, $dbuser_password);
                    } else {
                        $encrypted_password = $instance->encrypt_password($user_password, $crypt_type);
                        $ok = ($dbuser_password == $encrypted_password);
                    }
                }
                return $ok;
                break;
        }
        return false;

    }


}