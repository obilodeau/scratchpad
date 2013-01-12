#!/usr/bin/perl
#
use strict;
use warnings;

sub arr {
    return;
}

my ($a, $b, $c) = arr()
    or die "returned empty!";
    

print defined($a)."\n";
print defined($b)."\n";
print defined($c)."\n";
