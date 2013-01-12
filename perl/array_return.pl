#!/usr/bin/perl
#
use strict;
use warnings;

my @test = ('str', 'ing');

sub arr {
    my ($count) = @_;

    if ($count == 1) {
        return 'string';
    } elsif ($count == 2) {
        return ( 'string1', 'string2' );
    } elsif ($count == 3) {
        return ( 'string1', 'string2', 'string3' );
    } else {
        return @test;
    }
}

sub arr_param {
    my ($a, @rest) = @_;

    print "a: $a\n";
    print "rest: @rest\n";

}

print "test1\n";
arr_param("test", "and", "other", "stuff");

print "test2\n";
arr_param("test", @test);

print "debug me\n";
