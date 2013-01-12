<?php
$str = 'one|two|three|four';

print_r(explode('|', $str));

$str = '|two|three|four';
$array = explode('|', $str);
print_r($array);

print "if array[0]\n";
if ($array[0]) {
    print "in if\n";
}
else {
    print "in else\n";
}
print "\n";

print "if isset array[0]\n";
if (isset($array[0])) {
    print "in if\n";
}
else {
    print "in else\n";
}
print "\n";
