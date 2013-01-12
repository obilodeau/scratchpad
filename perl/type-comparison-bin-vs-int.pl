#!/usr/bin/perl

use strict;
use warnings;

my $bin = 0b00001000;
my $int = 8;

if ($bin == $int) {
    print 'same!';
} else {
    print 'different';
}
print "\n";
