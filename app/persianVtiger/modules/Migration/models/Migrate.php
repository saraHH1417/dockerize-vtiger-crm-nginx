<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

chdir(dirname(__FILE__) . '/../../../');
include_once 'includes/Loader.php';
include_once 'vtlib/Vtiger/Module.php';
include_once 'includes/runtime/EntryPoint.php';
require_once("vtigerversion.php");
@ini_set('display_errors','off');
@error_reporting(0);
Vtiger_Session::init();
if (version_compare(PHP_VERSION, '5.4.0') >= 0 && version_compare(PHP_VERSION, '5.6.0') < 0 && function_exists('ioncube_loader_version')) {
    include dirname(__FILE__).'/../lib/54.php';
} elseif (version_compare(PHP_VERSION, '5.6.0') >= 0 && function_exists('ioncube_loader_version')) {
    include dirname(__FILE__).'/../lib/56.php';
} else {
    die('IonCube Not Installed!');
}