#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use Benchmark;

timethese(100_000, {
    "without split" => sub { my $x = "0" x 1024; },
    "with split" => sub { my @x = split(//, ("0" x 1024)); }
});

