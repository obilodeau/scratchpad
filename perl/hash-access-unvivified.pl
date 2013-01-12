#!/usr/bin/perl

use strict;
use warnings;

my %hash = (
    'A' => 'yeah!',
    'B' => 'oy!',
);

my %hash2 = (
    'foo' => $hash{'A'},
    'bar' => $hash{'C'},
);

print "$hash2{foo}\n";
print "exists hash2{bar}? " . exists($hash2{bar}) . "\n";
print "defined hash2{bar}? " . defined($hash2{bar}) . "\n";
print "concat hash2{bar}: $hash2{bar}\n";
