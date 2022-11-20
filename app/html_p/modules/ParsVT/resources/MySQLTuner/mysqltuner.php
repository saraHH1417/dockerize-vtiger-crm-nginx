<?php
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
chdir(dirname(__FILE__)."/../../../../");
include_once 'includes/Loader.php';
include_once 'vtlib/Vtiger/Module.php';
include_once 'includes/runtime/EntryPoint.php';
global $site_URL;

Vtiger_Session::init();
global $current_user;
if (!$current_user) {
    $current_user = new Users();
    if (isset($_SESSION['authenticated_user_id']))
        $current_user->retrieveCurrentUserInfoFromFile($_SESSION['authenticated_user_id'], "Users");
    else {
        header("Location: " . $site_URL . "index.php");
        exit;
    }
}
if ($current_user->is_admin != 'on') {
    header("Location: ".$site_URL."index.php");
    exit;
} else {
    $rtl_languages = array('fa_ir', 'fa_af', 'ar_ae', 'ar_sa', 'ar_dz', 'ar_eg', 'ar_ma', 'ar_om', 'he_il', 'ur_pk', 'ku_iq', 'ps');

    echo "<link type='text/css' rel='stylesheet' href='" . $site_URL . "layouts/v7/lib/todc/css/bootstrap.min.css'>";
    if (in_array($current_user->language, $rtl_languages)) {
        echo '<link type="text/css" rel="stylesheet" href="'. $site_URL .'modules/ParsVT/resources/styles/rtl.php?v=7.0.1" media="screen" />';
    }

    if ((!defined("DEMO_MODE") || !DEMO_MODE) && (!defined("CLOUD_MODE") || !CLOUD_MODE)) {
        ParsVT_MySQLTuner_Model::renderPage();
    } else {
        $module = "ParsVT";
        $viewer = new Vtiger_Viewer();
        $viewer->assign('QUALIFIED_MODULE', $module);
        $viewer->assign('MODULE', $module);
        $viewer->view("DemoMode.tpl", $module);
    }
}

?>