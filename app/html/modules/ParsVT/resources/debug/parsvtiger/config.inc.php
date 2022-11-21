<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'parsvtiger');

ini_set('display_errors', 'on');

error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_WARNING & ~E_STRICT & ~E_USER_WARNING);

$dbconfig['log_sql'] = true;

register_shutdown_function(function() {
    global $root_directory;
    $logFiles = [
        'vtigercrm.log',
        'parsvtiger.log',
        'installation.log',
        'migration.log',
        'platform.log',
        'security.log',
        'soap.log',
        'sqltime.log'
    ];
    foreach ($logFiles as $logFile) {
        chmod($root_directory.'/logs/'.$logFile, 0777);
    }
});
