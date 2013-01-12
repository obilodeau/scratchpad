#!/usr/bin/perl 

use strict;
use warnings;

my @content;

push @content, "haystack\n";
push @content, "haystack\n";
push @content, "needle\n";
push @content, "haystack\n";
push @content, "haystack\n";

# doesn't work
# Warning: Applying pattern match (m//) to @array will act on scalar...
if (@content =~ /^(needle)/) {
    print "found: $1\n";
}

foreach my $line (@content) {
    if ($line =~ /^(needle)/) {
        print "found: $1\n";
    }
}

