<?php
require_once 'data/VTEntityDelta.php';
include_once "include/Webservices/Utils.php";
class ParsVTCustomHandler extends VTEventHandler {

    function handleEvent($eventName, $entityData) {
        global $adb;
        $moduleName = $entityData->getModuleName();
        $data = $entityData->getData();
        $record = $entityData->getId();
        $isNew = $entityData->isNew();
        if ($eventName == 'vtiger.entity.beforesave') {
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.beforesave.modifiable') {
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.beforesave.final') {
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.aftersave') {
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.aftersave.final') {
            if ($moduleName == 'Modulename') {

            }
        }
        if($eventName === 'vtiger.batchevent.save'){
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.beforedelete') {
            if ($moduleName == 'Modulename') {

            }
        }
        if ($eventName == 'vtiger.entity.afterdelete') {
            if ($moduleName == 'Modulename') {

            }
        }
        if($eventName === 'vtiger.batchevent.delete'){
            if ($moduleName == 'Modulename') {

            }
        }
        if($eventName === 'vtiger.entity.afterrestore'){

        }

        if($eventName === 'vtiger.lead.convertlead'){
            if ($moduleName == 'Leads') {
                //$convertedEntityIdsInfo = $entityData->entityIds;
                //$transferRelatedRecordsTo = $entityData->transferRelatedRecordsTo;

            }
        }
        if($eventName === 'vtiger.picklist.afterrename'){
            //$entityData['newvalue']
            //$entityData['oldvalue']

        }
        if($eventName === 'vtiger.picklist.afterdelete'){
            //$entityData['replacevalue']
            //$entityData['valuetodelete']
        }
    }
}

