#!/usr/bin/perl 

use strict;
use warnings;

# matching chomped newlines
my @matches = ("3452346\n341345\n", "3452345\n");
foreach (@matches) {
    chomp;
    print "matched newline in ($_)\n" if (/\n/);
}
