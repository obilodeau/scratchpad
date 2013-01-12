#!/usr/bin/perl 

use strict;
use warnings;

#
# undef stuff
#
print sprintf("Passing undef to a sprintf, warnings?\n", undef);

my $a_ref = [];
print sprintf("Passing empty array ref to a sprintf, warnings?\n", @$a_ref);

print "Awesomessss!!!\n";

print sprintf("Passing a variable but nothing consumes it, warning?\n", 'foo');

$a_ref = undef;
#print sprintf("Passing undefined array ref to a sprintf, warnings?\n", @$a_ref);


#
# positional parameters
#
print sprintf("this is third %3\$s. this is first %1\$s.\n", "one", "two", "three");
