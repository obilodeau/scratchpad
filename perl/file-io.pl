#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';

# very basic file-out
open(my $fh, ">", "file");
say $fh "something1";
say $fh "something2";
close($fh);
