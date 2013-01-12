#!/usr/bin/perl 

use strict;
use warnings;

use v5.12.0;

sub test {
   say "no semi colon in last statement of a BLOCK"
}

test();
say 'looks like that works';
