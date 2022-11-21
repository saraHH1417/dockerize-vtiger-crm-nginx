<?php

define('PARSVT_TOOLS_DEBUG_MODE', 'all_errors');

include '__DEBUG_MODE__.config.inc.php';

ini_set('display_errors','on'); error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
