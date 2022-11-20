<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'fatal_error');

ini_set('display_errors', 'on');

error_reporting(E_ERROR);

register_shutdown_function(function() {
    $error = error_get_last();
    if ($error !== null && $error['type'] === E_ERROR) {
        http_response_code(500);
    }
});
