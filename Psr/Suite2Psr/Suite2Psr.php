<?php
echo 'Suite2Psr'.PHP_EOL;
echo print_r($argv, 1).PHP_EOL;

require("Configuration.php");
require("Application.php");
require("Modules.php");
require("Extension.php");
// Get Command line arguments
if(!file_exists($BUILD_ROOT)) { mkdir($BUILD_ROOT, 0777, true); }

echo 'PS4 Tasks'.PHP_EOL;

$tasks = scandir($TASKS_ROOT);

foreach($tasks as $task) {
    if($task == '.' || $task == '..') {
        continue;
    } else if(substr($task, 0, 1) == 'x') {
        continue;
    }
    echo '    '.$task.PHP_EOL;
    require_once $TASKS_ROOT.$task;
}

echo 'PSR4 Patches'.PHP_EOL;

$patches = scandir($PATCHES_ROOT);

foreach($patches as $patch) {
    if($patch == '.' || $patch == '..') {
        continue;
    } else if(substr($patch, 0, 1) == 'x') {
        continue;
    }
    echo '    '.$patch.PHP_EOL;
    require_once $PATCHES_ROOT.$patch;
}

// Output changes
file_put_contents(dirname(__FILE__).DIRECTORY_SEPARATOR.'__$MAP_FILES.json', json_encode($MAP_FILES));

die();
?>