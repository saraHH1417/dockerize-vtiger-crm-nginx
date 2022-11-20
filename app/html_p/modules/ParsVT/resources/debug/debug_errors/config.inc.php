<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'debug_errors');

include '__DEBUG_MODE__.config.inc.php';

ini_set('display_errors','on'); version_compare(PHP_VERSION, '5.5.0') <= 0 ? error_reporting(E_WARNING & ~E_NOTICE & ~E_DEPRECATED) : error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);   // DEBUGGING

