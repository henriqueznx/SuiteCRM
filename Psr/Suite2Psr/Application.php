<?php
echo 'Suite2Psr Application'.PHP_EOL;
const sugarEntry = 'defined';

require_once "Utils.php";

if(!file_exists($APPLICATION_ROOT)) { mkdir($APPLICATION_ROOT, 0777, true); }


$tasks = scandir($APPLICATION_TASKS_ROOT);

foreach($tasks as $task) {
    if($task == '.' || $task == '..') {
        continue;
    }
    require_once $APPLICATION_TASKS_ROOT.$task;
}

?>