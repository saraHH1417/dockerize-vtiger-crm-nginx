<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'module_install_problem');

ini_set('display_errors', 'on');

error_reporting(E_ERROR);

register_shutdown_function(function() {
    global $root_directory;
    $error = error_get_last();
    if ($error !== null && $error['type'] === E_ERROR) {
        print_r(file_put_contents($root_directory.'/logs/debug.log', print_r($error, true)));
        http_response_code(500);
    }
});
