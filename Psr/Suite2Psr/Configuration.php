<?php
echo 'Suite2Psr Configuration'.PHP_EOL;
global $SUITECRM_ROOT, $VENDOR, $BUILD_ROOT, $APPLICATION_ROOT, $MODULES_ROOT, $EXTENSION_ROOT;
$SUITECRM_ROOT = dirname(dirname(__DIR__));

echo 'SuiteCRM Source Directory: ';
echo print_r($SUITECRM_ROOT.PHP_EOL, 1);
/**
 * VENDOR PATHS
 * Old Suite CRM path => new SuiteCRM Path
 * @uses php_inc.php copy_recursive
 */
$VENDOR = array(
    'include'.DIRECTORY_SEPARATOR.'HTMLPurifier'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'HTMLPurifier'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'HTTP_WebDAV_Server'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'HTTP_WebDAV_Server'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'nusoap'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'nusoap'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'pclzip'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'pclzip'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Pear'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'Pear'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'phpmailer'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'phpmailer'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'reCaptcha'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'reCaptcha'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'tcpdf'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'tcpdf'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Smarty'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'Smarty'.DIRECTORY_SEPARATOR,
    'Zend'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'Zend'.DIRECTORY_SEPARATOR,
    'XTemplate'.DIRECTORY_SEPARATOR => 'vendor'.DIRECTORY_SEPARATOR.'XTemplate'.DIRECTORY_SEPARATOR,
);
$BUILD_ROOT = __DIR__.DIRECTORY_SEPARATOR.'Build'.DIRECTORY_SEPARATOR.'SuiteCRM';
$APPLICATION_ROOT = __DIR__.DIRECTORY_SEPARATOR.'Build'.DIRECTORY_SEPARATOR.'SuiteCRM'.DIRECTORY_SEPARATOR.'Application';
$MODULES_ROOT = __DIR__.DIRECTORY_SEPARATOR.'Build'.DIRECTORY_SEPARATOR.'SuiteCRM'.DIRECTORY_SEPARATOR.'Module';
$EXTENSION_ROOT = __DIR__.DIRECTORY_SEPARATOR.'Build'.DIRECTORY_SEPARATOR.'SuiteCRM'.DIRECTORY_SEPARATOR.'Extension';


?>