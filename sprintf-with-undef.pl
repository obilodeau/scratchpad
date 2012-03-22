#!/usr/bin/perl 

use strict;
use warnings;

print sprintf("Passing undef to a sprintf, warnings?\n", undef);

my $a_ref = [];
print sprintf("Passing empty array ref to a sprintf, warnings?\n", @$a_ref);

print "Awesomessss!!!\n";

my $a_ref = undef;
print sprintf("Passing undefined array ref to a sprintf, warnings?\n", @$a_ref);
