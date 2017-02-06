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


say 'fill hash with split';
my $query = "id=12345&foo=bar&bar=baz";
say "Before: $query";
my $parsed = {};
%$parsed = map { split /=/ } split(/&/, $query);
say 'After: ' . Dumper($parsed);
