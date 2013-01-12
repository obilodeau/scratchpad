#!/usr/bin/perl
#
use strict;
use warnings;

my @array;

push @array, add_a_couple();
push @array, add_a_couple();

foreach my $entry (@array) {
    print $entry->{'severity'}  . " - " . $entry->{'message'} . "\n";
    #print $entry->{'severity'}  . " - " . $entry->{'message'} . "\n";
}

sub add_a_couple {

    my @int_array;
    foreach my $val ("one", "two", "three") {
        push @int_array, { 'severity' => "WARN", 'message' => $val };
    }
    return @int_array;
}
