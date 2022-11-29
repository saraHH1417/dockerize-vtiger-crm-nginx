<?php


$templateFilename = 'config.inc.php';
if (file_exists($templateFilename)) {
    $configfile = file_get_contents($templateFilename);
    if (!empty($configfile)) {
        /* replace _DBC_ variable */
        $configfile = str_replace("_DBC_SERVER_", addslashes($_REQUEST['db_hostname']), $configfile);
        $configfile = str_replace("_DBC_USER_", addslashes($_REQUEST['db_username']), $configfile);
        $configfile = str_replace("_DBC_PASS_", addslashes($_REQUEST['db_password']), $configfile);
        $configfile = str_replace("_DBC_NAME_", addslashes($_REQUEST['db_name']), $configfile);
        /* replace dir variable */
        // $configfile = str_replace("_VT_ROOTDIR_", getcwd()."/", $configfile);
        $configfile = str_replace("_VT_ROOTDIR_", "/var/www/html", $configfile);
        /* replace the application unique key variable */
        $uniKey = md5(time() + rand(1, 9999999) + md5($_SERVER['SERVER_NAME']));
        $configfile = str_replace("_VT_APP_UNIQKEY_", $uniKey, $configfile);
        file_put_contents('config.inc.php',$configfile);
    }
}
// @unlink("_install.php");