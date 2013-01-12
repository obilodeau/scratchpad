#!/usr/bin/perl

use warnings;
use strict;

my $arrayref = [];
print $$arrayref[0] || '';

$arrayref = ["test\n"];
print $$arrayref[0] || '';

print "terminated\n";
