<?php
function TextField($arg)
{
    if(!array_key_exists('name',$arg)) {
        $arg['name'] = 'Text';
    }

    if(!array_key_exists('label',$arg)) {
        $arg['vname'] = $arg['label'];
    }

    $array = array(
        'name' => $arg['name'],
        'value' => '',
        'vname' => 'LBL_TEXT',
        'type' => 'varchar',
        'len' => 255,
        'required' => false,
        'reportable' => false,
        'massupdate' => false,
    );
    $field = array($arg['name'] => $array);
    return $field;
}