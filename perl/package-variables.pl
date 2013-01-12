#!/usr/bin/perl 

use v5.12.0;

use strict;
use warnings;

use Readonly;

#
# Proof of Concept
#
# In these I do fancy attempts to copy Readonly constants from a package
# into an hash so I can pass it to Template Toolkit.
#
package CONSTS;

sub load_constants { 
    no strict 'refs';
    # slurps everything
    #return map { $_ => ${__PACKAGE__."::$_"} } keys %CONSTS::; 

    # slurps only variables
    return map { $_ => ${__PACKAGE__."::$_"} if defined ${$_} } keys %CONSTS::;
}

Readonly::Scalar our $A => 'a';

package main;

say "referring to constant fully qualified: $CONSTS::A";

my %local_consts = CONSTS::load_constants();
#$DB::single = 1;
say "referring to constant copied into a local hash: $local_consts{A}";
