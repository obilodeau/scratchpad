#!/usr/bin/perl 

use strict;
use warnings;

sub ambiguous_context {
    return (0); # in the end the parenthesis changes nothing
}

# forcing list context, we get what we expect
my @result = ambiguous_context();
if (@result) {
    print 'Getting true', "\n";
}
else {
    print 'Getting false', "\n";
}

# but what about if we call it in boolean context?
if (ambiguous_context()) {
    print 'Expecting false but getting true', "\n";
}
else {
    print 'Expecting false getting false', "\n";
}
