#!/usr/bin/perl
#
#
use strict;
use warnings;

my $bitstr = '0101000001';
my $match= '0001';
my $no_match= '00001';

print "should match matches\n" if (($bitstr & $match) == $match);

print "should not match doesn't matches\n" if (($bitstr & $no_match) != $no_match);
