<?php
/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class PBXManager_Detail_View extends Vtiger_Detail_View{
    
    /**
     * Overrided to disable Ajax Edit option in Detail View of
     * PBXManager Record
     */
    function isAjaxEnabled($recordModel) {
		return false;
	}
 
    /*
     * Overided to convert totalduration to minutes
     */
    function preProcess(Vtiger_Request $request, $display=true) {
		$recordId = $request->get('record');
		$moduleName = $request->getModule();
		if(!$this->record){
			$this->record = Vtiger_DetailView_Model::getInstance($moduleName, $recordId);
		}
		$recordModel = $this->record->getRecord();
        
       // To show recording link only if callstatus is 'completed' 
        if($recordModel->get('callstatus') != 'completed') { 
            $recordModel->set('recordingurl', ''); 
        }
        // VTFarsi.ir begin
        $rl = $recordModel->get('recordingurl');
        if($recordModel->get('callstatus') == 'completed' && !empty($rl)) {
            // $recordModel->set('recordingurl', '<a href="'.$recordModel->get('recordingurl').'" ><i class="icon-volume-up"></i>Download</a>');
            $recordModel->set('recordingurl', '<audio preload="metadata" src="' . $recordModel->get('recordingurl') . '" controls></audio>');
        }
        // VTFarsi.ir end
        return parent::preProcess($request, true);
	}
}
