<?php

// Set up autoloading and bootstrap SuiteCRM test suite
if (!defined('sugarEntry')) {
    define('sugarEntry', true);
    define('SUITE_PHPUNIT_RUNNER', true);
}
/* bootstrap composer's autoloader */
require_once __DIR__.'/../vendor/autoload.php';
include __DIR__ .'/../include/MVC/preDispatch.php';
global $sugar_config, $db;
require_once __DIR__ .'/../include/utils.php';
require_once __DIR__ .'/../include/modules.php';
require_once __DIR__ .'/../include/entryPoint.php';
//Oddly entry point loads app_strings but not app_list_strings, manually do this here.
$GLOBALS['current_language'] = 'en_us';
$GLOBALS['app_list_strings'] = return_app_list_strings_language($GLOBALS['current_language']);

/* VERY BAD :-( - but for now at least tests are running */
$GLOBALS['sugar_config']['resource_management']['default_limit'] = 999999;



