#!/usr/bin/perl 

use strict;
use warnings;

my @array = (1, 2, 3);

print "Reversing in foreach\n";
foreach my $i (reverse @array) {

    print "$i ";

}
print "\nworks as expected\n";
