<?php
echo 'Suite2Psr Configuration'.PHP_EOL;
global $SUITECRM_ROOT, $VENDOR, $APPLICATION, $BUILD_ROOT, $APPLICATION_ROOT, $MODULES_ROOT, $EXTENSION_ROOT, $APPLICATION_TASKS_ROOT, $SUITE2PSR_ROOT,
       $MAP_FILES;
/**
 * ROOT DIRECTORIES
 */
$SUITECRM_ROOT = dirname(dirname(__DIR__)).DIRECTORY_SEPARATOR;
$SUITE2PSR_ROOT = $SUITECRM_ROOT.DIRECTORY_SEPARATOR.'Psr'.DIRECTORY_SEPARATOR.'Suite2Psr'.DIRECTORY_SEPARATOR;
$BUILD_ROOT = $SUITE2PSR_ROOT.'Build'.DIRECTORY_SEPARATOR.'SuiteCRM'.DIRECTORY_SEPARATOR;
$APPLICATION_ROOT = $BUILD_ROOT.'Application'.DIRECTORY_SEPARATOR;
$MODULES_ROOT = $BUILD_ROOT.'Module'.DIRECTORY_SEPARATOR;
$EXTENSION_ROOT = $BUILD_ROOT.'Extension'.DIRECTORY_SEPARATOR;
$TASKS_ROOT = $SUITE2PSR_ROOT.'PSR4'.DIRECTORY_SEPARATOR.'Tasks'.DIRECTORY_SEPARATOR;
$PATCHES_ROOT = $SUITE2PSR_ROOT.'PSR4'.DIRECTORY_SEPARATOR.'Patch'.DIRECTORY_SEPARATOR;



/**
 * MAPS FILE into an array( from => to )
 */
$MAP_FILES = array();
$MAP_FILES['moved'] = array();

echo 'SuiteCRM Source Directory: ';
echo print_r($SUITECRM_ROOT.PHP_EOL, 1);
/**
 * VENDOR PATHS
 * Old Suite CRM path => new SuiteCRM Path
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
/**
 * $APPLICATION PATHS
 * Old Suite CRM path => new SuiteCRM Path
 */
$APPLICATION = array(
       /**
        * include contains vendor code
        * include locations must be more specific
        */
    'include'.DIRECTORY_SEPARATOR.'connectors' => 'connectors'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'contextMenus' => 'contextMenus'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'controller' => 'controller'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Dashlets' => 'Dashlets'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'database' => 'database'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'DetailView' => 'DetailView'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'EditView' => 'EditView'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'externalAPI' => 'externalAPI'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'fonts' => 'fonts'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'generic' => 'generic'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'GroupedTabs' => 'GroupedTabs'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'images' => 'images'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'InlineEditing' => 'InlineEditing'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'javascript' => 'javascript'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'language' => 'language'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'ListView' => 'ListView'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Localization' => 'Localization'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'MVC' => 'MVC'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'MySugar' => 'MySugar'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'OutboundEmail' => 'OutboundEmail'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Popups' => 'Popups'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'resource' => 'resource'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SearchForm' => 'SearchForm'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SubPanel' => 'SubPanel'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarCache' => 'SugarCache'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarCharts' => 'SugarCharts'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarDependentDropdown' => 'SugarDependentDropdown'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarEmailAddress' => 'SugarEmailAddress'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarFields' => 'SugarFields'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarFolders' => 'SugarFolders'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarHtml' => 'SugarHtml'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarLogger' => 'SugarLogger'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarObjects' => 'SugarObjects'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'Sugarpdf' => 'Sugarpdf'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarQueue' => 'SugarQueue'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarTheme' => 'SugarTheme'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'SugarXHprof' => 'SugarXHprof'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'TemplateHandler' => 'TemplateHandler'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'templates' => 'templates'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'timezone' => 'timezone'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'utils' => 'utils'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'VarDefHandler' => 'VarDefHandler'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'ytree' => 'ytree'.DIRECTORY_SEPARATOR,
    'include'.DIRECTORY_SEPARATOR.'clean.php' => 'clean.php',
    'include'.DIRECTORY_SEPARATOR.'dir_inc.php' => 'dir_inc.php',
    'include'.DIRECTORY_SEPARATOR.'entryPoint.php' => 'entryPoint.php',
    'include'.DIRECTORY_SEPARATOR.'export_utils.php' => 'export_utils.php',
    'include'.DIRECTORY_SEPARATOR.'formbase.php' => 'formbase.php',
    'include'.DIRECTORY_SEPARATOR.'globalControlLinks.php' => 'globalControlLinks.php',
    'include'.DIRECTORY_SEPARATOR.'JSON.php' => 'JSON.php',
    'include'.DIRECTORY_SEPARATOR.'json_config.php' => 'json_config.php',
    'include'.DIRECTORY_SEPARATOR.'MassUpdate.php' => 'MassUpdate.php',
    'include'.DIRECTORY_SEPARATOR.'modules.php' => 'modules.php',
    'include'.DIRECTORY_SEPARATOR.'parsecsv.lib.php' => 'parsecsv.lib.php',
    'include'.DIRECTORY_SEPARATOR.'php-sql-parser.php' => 'php-sql-parser.php',
    'include'.DIRECTORY_SEPARATOR.'QuickSearchDefaults.php' => 'QuickSearchDefaults.php',
    'include'.DIRECTORY_SEPARATOR.'Sugar_Smarty.php' => 'Sugar_Smarty.php',
    'include'.DIRECTORY_SEPARATOR.'SugarDateTime.php' => 'SugarDateTime.php',
    'include'.DIRECTORY_SEPARATOR.'SugarHttpClient.php' => 'SugarHttpClient.php',
    'include'.DIRECTORY_SEPARATOR.'SugarOauth.php' => 'SugarOauth.php',
    'include'.DIRECTORY_SEPARATOR.'SugarOAuthServer.php' => 'SugarOAuthServer.php',
    'include'.DIRECTORY_SEPARATOR.'SugarPHPMailer.php' => 'SugarPHPMailer.php',
    'include'.DIRECTORY_SEPARATOR.'SugarSQLValidate.php' => 'SugarSQLValidate.php',
    'include'.DIRECTORY_SEPARATOR.'SugarTinyMCE.php' => 'SugarTinyMCE.php',
    'include'.DIRECTORY_SEPARATOR.'tabConfig.php' => 'tabConfig.php',
    'include'.DIRECTORY_SEPARATOR.'tabs.php' => 'tabs.php',
    'include'.DIRECTORY_SEPARATOR.'TimeDate.php' => 'TimeDate.php',
    'include'.DIRECTORY_SEPARATOR.'upload_file.php' => 'upload_file.php',
    'include'.DIRECTORY_SEPARATOR.'utils.php' => 'utils.php',
    'include'.DIRECTORY_SEPARATOR.'vCard.php' => 'vCard.php',
    'ModuleInstall'.DIRECTORY_SEPARATOR => 'ModuleInstall'.DIRECTORY_SEPARATOR,
    'data'.DIRECTORY_SEPARATOR => 'data'.DIRECTORY_SEPARATOR,
    'themes'.DIRECTORY_SEPARATOR => 'themes'.DIRECTORY_SEPARATOR,
    'jssource/src_files/include/'.DIRECTORY_SEPARATOR => '',
);

?>