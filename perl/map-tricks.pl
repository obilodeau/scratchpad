#!/usr/bin/perl 

use strict;
use warnings;
use feature 'say';

use Data::Dumper;

my $hashref = {
    'foo' => 'a',
    'bar' => 'b',
};

say 'Trying to transform array keys by prepending with _';
say 'Before: ' . Dumper($hashref);
%$hashref = map { '_'.$_ => $hashref->{$_} } keys %$hashref;
say 'After: ' . Dumper($hashref);
