<?php

/**
 * Function to authenticate users to LDAP
 *
 * @param string $authUser -  Username to authenticate
 * @param string $authPW - Cleartext password
 * @return NULL on failure, user's info (in an array) on bind
 */
function ldapAuthenticate($authUser, $authPW)
{
    global $AUTHCFG, $adb,$roleLDAP;
    $AUTHCFG['authType'] = "SQL";

    $sql    = "select * from vtiger_ldap_settings";
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

    if (empty($roleLDAP) || !is_array($roleLDAP)) $roleLDAP = array();
    if ($AUTHCFG['exclude_roles'] != "") {
        $roleLDAP = array_merge($roleLDAP, explode(PHP_EOL,$AUTHCFG['exclude_roles']));
    }
    if ($authUser != "" && $authPW != "") {
        $num_records = 0;
        if (!empty($roleLDAP)) {
            $sql = "SELECT * FROM `vtiger_users` INNER JOIN `vtiger_user2role` ON `vtiger_user2role`.`userid` = `vtiger_users`.`id` WHERE `vtiger_users`.`user_name` = ? AND `vtiger_user2role`.`roleid` IN (" . generateQuestionMarks($roleLDAP) . ") ; ";
            $userList = $adb->pquery($sql, array($authUser, $roleLDAP));
            $num_records = $adb->num_rows($userList)> 0;
        }
        if ($authUser == "admin" || $num_records ) {
            $query  = "SELECT crypt_type, user_password FROM vtiger_users WHERE user_name=?";
            $result = $adb->pquery($query,array($authUser));
            if ($adb->num_rows($result) > 0) {
                while ($result && $row = $adb->fetch_row($result)) {
                    $crypt_type    = $row["crypt_type"];
                    $user_password = $row["user_password"];
                    $found         = true;
                }
                if (!$found) {
                    return false;
                }
                if ($crypt_type == 'PHASH') {
                    return password_verify($authPW, $user_password);
                } else {
                    $encrypted_password = pars_ldap_encrypt_password($authUser, $authPW, $crypt_type);
                    $query              = "SELECT * from vtiger_users where user_name=? AND user_password=?";
                    $result             = $adb->pquery($query,array($authUser,$encrypted_password));
                    while ($result && $row = $adb->fetch_row($result)) {
                        return true;
                    }
                }
            }
        }


        if ($AUTHCFG['ldap_port'] == "") {
            $AUTHCFG['ldap_port'] = "389";
        }
        $ds = @ldap_connect($AUTHCFG['ldap_host'], $AUTHCFG['ldap_port']);
        @ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3); //Try version 3.  Will fail and default to v2.

        $bind   = false;
        $find   = false;
        $query  = "SELECT * from vtiger_users where user_name=\"$authUser\" and `status`='Active' limit 1";
        $result = $adb->query($query);
        while ($result && $row = $adb->fetch_row($result)) {
            $find = true;
        }
        if ($find) {
            $dn   = $authUser . $AUTHCFG['ad_accountsuffix'];
            $bind = ldap_bind($ds, $dn, $authPW);
            // verify binding
            if ($bind) {
                return true;
            } else {
                return false;
            }

        } else return false;
    } else return false;
}

function pars_ldap_encrypt_password($user_name, $user_password, $crypt_type)
{
    // encrypt the password.
    $salt = substr($user_name, 0, 2);

    if ($crypt_type == 'PHASH') {
        return password_hash($user_password, PASSWORD_DEFAULT);
        // For more details on salt format look at: http://in.php.net/crypt
    } elseif ($crypt_type == 'MD5') {
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