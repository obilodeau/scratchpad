#!/usr/bin/perl

use strict;
use warnings;

use LWP::Simple;
 
my $data = getprint("http://perdu.com");

print "Success!\n";
