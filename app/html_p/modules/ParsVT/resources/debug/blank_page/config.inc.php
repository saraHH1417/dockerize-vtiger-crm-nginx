<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'blank_page');

ini_set('display_errors', 'on');

error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_WARNING & ~E_STRICT & ~E_USER_WARNING);

register_shutdown_function(function() {
    $error = error_get_last();
    $error['fatal'] = $error['type'] === E_ERROR;
    $error['message'] = explode("\n", $error['message']);
    echo '<pre style="background:#eee;border:1px solid #ccc;padding:8px;margin:8px;">';
    echo 'LAST ERROR: '.json_encode($error, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES)."\n";
    echo '</pre>';
    if ($error !== null && $error['type'] === E_ERROR) {
        http_response_code(500);
    }
});


