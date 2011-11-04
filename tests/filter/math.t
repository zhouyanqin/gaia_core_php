#!/usr/bin/env php
<?php
include __DIR__ . '/../common.php';

use Gaia\Test\Tap;
use Gaia\UTF8;

$raw = file_get_contents(__DIR__ . '/math.txt');



if( strlen( $raw ) < 1 ){
    Tap::plan('skip_all', 'unable to load test data');
}


Tap::plan(52);
foreach(explode("\n", $raw) as $i=>$line ){
    $newline = UTF8::to($line);
    Tap::ok( $newline == $line , "didnt change encoding of line ".  ($i + 1) . ' :' . trim($line));
}
