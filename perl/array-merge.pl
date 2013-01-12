#!/usr/bin/perl
#
use strict;
use warnings;

my @keys = ('key1', 'key2', 'key3');
my @values = ( 'val1', 'val2', 'val3');

my $hash_ref = { map { shift(@keys) => $_ } @values };

use Data::Dumper;
print Dumper($hash_ref);
