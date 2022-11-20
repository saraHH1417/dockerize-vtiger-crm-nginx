<?php

chdir(dirname(__FILE__) . "/../../");
$Vtiger_Utils_Log = true;
include_once 'includes/Loader.php';
include_once 'vtlib/Vtiger/Module.php';
include_once 'includes/runtime/EntryPoint.php';
include "modules/ParsLDAP/include.php";

global $AUTHCFG;
$ldapconfig = array();
$ldapconfig['ldap_host'] = $AUTHCFG['ldap_host'];//CHANGE THIS TO THE CORRECT LDAP SERVER
$ldapconfig['ldap_port'] = $AUTHCFG['ldap_port'];
$ldapconfig['suffix'] = $AUTHCFG['ad_accountsuffix'];
$username = $_REQUEST['username'];
$password = $_REQUEST['password'];
if (!empty($username) && !empty($password)) {
    $ds = @ldap_connect($ldapconfig['ldap_host'], $ldapconfig['ldap_port']);
    @ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3); //Try version 3.  Will fail and default to v2.
    $dn = $username . $ldapconfig['suffix'];
    $bind = ldap_bind($ds, $dn, $password);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <style>
        form {
            margin: 0 auto;
            width: 300px
        }

        input {
            margin-bottom: 3px;
            padding: 10px;
            width: 100%;
            border: 1px solid #CCC
        }

        button {
            padding: 10px
        }

        label {
            cursor: pointer
        }

        #form-switch {
            display: none
        }
        #form-switch:checked ~ #login-form {
            display: none
        }
    </style>

</head>

<body translate="no">
<form id='login-form' action="<?php echo htmlspecialchars($_SERVER[‘PHP_SELF’]); ?>" method='post'>
    <?php
    if (!empty($username) && !empty($password)) {
        // verify binding
        if ($bind) {
            var_dump($bind);
        } else {
            var_dump(false);
        }
    }
    ?>
    <input name="username" type="text" placeholder="Username" value="<?php echo $username; ?>" required><?php echo $ldapconfig['suffix']; ?>
    <input name="password" type="password" placeholder="Password"  value="<?php echo $password; ?>" required>
    <button type='submit'>Login</button>
</form>
</body>

</html>

