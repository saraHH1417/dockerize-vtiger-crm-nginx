<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/
require dirname(__FILE__).'/../models/Migrate.php';
if (isset($_POST['_key'])) {
    $validate = new Migrate_Migrate_Model($_REQUEST['_key']);
    $results = $validate->Activate();
    echo json_encode($results);
    exit;
} else {
    die(json_encode(array('success'=> false,'response' => "<div class='alert alert-danger'>Invalid Request</div>")));
}
