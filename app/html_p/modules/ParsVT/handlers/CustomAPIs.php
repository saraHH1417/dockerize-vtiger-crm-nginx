<?php
include_once "modules/ParsVT/V2/Webservices/Utils.php";
function vtws_get_record_label( $recordId, $user )
{
    global $log,$adb;
    if (!empty($recordId) && strpos($recordId, 'x') === false) {
        $setype = Vtiger_Functions::getCRMRecordType($recordId);
        if (empty($setype)) {
            throw new WebServiceException(WebServiceErrorCode::$INVALIDID,"Id specified is incorrect");
        }
        $result = $adb->pquery("select * from vtiger_ws_entity where name=?", array($setype));
        if ($adb->num_rows($result) == 0) {
            return false;
        }
        $wsname = $adb->query_result_rowdata($result, 0);
        $recordId = $wsname['id'].'x'.$recordId;
    }
    $cidComponents = vtws_getIdComponents($recordId);
    $webserviceObject = VtigerWebserviceObject::fromId($adb,$cidComponents[0]);
    $handlerPath = $webserviceObject->getHandlerPath();
    $handlerClass = $webserviceObject->getHandlerClass();
    require_once $handlerPath;
    $handler = new $handlerClass($webserviceObject,$user,$adb,$log);
    $meta = $handler->getMeta();
    $entityName = $meta->getObjectEntityName($recordId);
    $types = vtws_listtypes(null, $user);

    if(!in_array($entityName,$types['types'])){
        throw new WebServiceException(WebServiceErrorCode::$ACCESSDENIED,"Permission to perform the operation is denied");
    }
    if($entityName !== $webserviceObject->getEntityName()){
        throw new WebServiceException(WebServiceErrorCode::$INVALIDID,"Id specified is incorrect");
    }
    if(!$meta->exists($cidComponents[1])){
        throw new WebServiceException(WebServiceErrorCode::$RECORDNOTFOUND,"Record you are trying to access is not found");
    }

    return Vtiger_Functions::getCRMRecordLabel($cidComponents[1]);

}

