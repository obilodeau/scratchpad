#!/usr/bin/perl 

use strict;
use warnings;

my %hash = (
    'foo' => 1,
    'bar' => 1,
    'baz' => 1,
);

print "joining hash keys only: ";
print join(" ", keys %hash);
print "\n";
