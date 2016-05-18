<?php
/**
 * if upstream is not set:
 * git remote add upstream $upstream
 *
 * process:
 * git fetch upstream
 * git checkout master
 * git merge upstream/master
 * git checkout develop
 * git merge upstream/develop
 * git checkout <feature branch>
 * git merge upstream/<feature branch>
 */
// set variable
$upstream_default = "https://github.com/salesagility/SuiteCRM.git";
$project_path = __DIR__;


// Error Checking
if(!file_exists($project_path.DIRECTORY_SEPARATOR.'.git/config')) {
    echo 'ERROR: cannot find .git/config'.PHP_EOL;
    exit();
}

$gitconfig = parse_ini_file($project_path.DIRECTORY_SEPARATOR.'.git/config', true);

if(!isset($gitconfig['remote origin'])) {
    echo 'ERROR: cannot find remote origin'.PHP_EOL;
    exit();

}

if(!isset($gitconfig['remote upstream'])) {
    // get upstream url if missing
    echo 'ERROR: cannot find remote upstream'.PHP_EOL;
    $line = readline('Enter upstream url ['.$upstream_default.']:');
    readline_add_history($line);
    if(empty($line)) {
        $upstream = $upstream_default;
    } else {
        $upstream = $line;
    }
    echo $upstream_exec = exec('git remote add upstream '.$upstream);
    sleep(2);
    $gitconfig = parse_ini_file($project_path.DIRECTORY_SEPARATOR.'.git/config', true);
}

$upstream = $gitconfig['remote upstream']['url'];
$fork = $gitconfig['remote origin']['url'];
echo '$upstream='.$upstream.PHP_EOL;
echo '$fork='.$fork.PHP_EOL;
echo '$project_path='.$project_path.PHP_EOL;
echo '$gitconfig='.print_r($gitconfig, true).PHP_EOL;
// get current branch
$current_branch = exec('git symbolic-ref --short -q HEAD');
echo $current_branch.PHP_EOL;
echo exec('git fetch upstream').PHP_EOL;
echo exec('git checkout master').PHP_EOL;
echo exec('git merge upstream/master').PHP_EOL;
if(isset($gitconfig['branch develop'])) {
    echo exec('git checkout develop');
    echo exec('git merge upstream/develop') . PHP_EOL;
}
echo exec('git checkout '.$current_branch).PHP_EOL;
echo exec('git merge upstream/'.$current_branch).PHP_EOL;
echo exec('git push --all origin');
exit();

?>