<?php
/*+********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *********************************************************************************/
include_once 'modules/com_vtiger_workflow/VTTaskManager.inc';
include_once 'include/utils/utils.php';

if(defined('VTIGER_UPGRADE')) {
	global $adb, $current_user;
	$adb = $db = PearDatabase::getInstance();
	$updateModulesList = array();
	$parsvt_direcory ='packages/parsvt/';
	if (file_exists($parsvt_direcory.'ParsVT.zip')) $updateModulesList['ParsVT'] = 'ParsVT.zip';
	if ($handle = opendir($parsvt_direcory)) {
	    while (false !== ($file = readdir($handle)))
	    {
	        if ($file != "." && $file != ".." && $file != "ParsVT.zip" && strtolower(substr($file, strrpos($file, '.') + 1)) == 'zip') {
	        	$updateModulesList[basename($file,".zip")] = $file;
	        }
	    }
	    closedir($handle);
	}
	foreach ($updateModulesList as $moduleName => $packageFile) {
		$packagePath =	$parsvt_direcory.$packageFile;
		if (file_exists($packagePath)) {
			$moduleInstance = Vtiger_Module::getInstance($moduleName);
			if($moduleInstance) {
				updateVtlibModule($moduleName, $packagePath);
			} else {
			    installVtlibModule($moduleName, $packagePath);
			} 
		} else {
			echo 'file '.$packagePath.' Not exists<br />';
		}
	}
}