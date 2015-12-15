<?php
function DateField($arg)
{
    $now = new DateTime();

    if(!array_key_exists('name',$arg)) {
        $arg['name'] = 'date';
    }
    $array = array(
        'name' => $arg['name'],
        'value' => $now->format('Y-m-d'),
        'vname' => 'LBL_ID',
        'type' => 'datetime',
        'len' => 255,
        'required' => false,
        'reportable' => false,
        'massupdate' => false,
    );
    $field = array($arg['name'] => $array);
    return $field;
}