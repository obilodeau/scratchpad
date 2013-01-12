<?php

$file = 'file.txt';

# flag is now an array with one line per array element
$flag = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

# get the second line
print $flag[1];

?>
