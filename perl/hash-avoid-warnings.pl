#!/usr/bin/perl 

use strict;
use warnings;

my $undefined;
my $assign_to = ($undefined->{'key'} || '');
print "no warnings with \$hash->{'key'} || '' construct. value: $assign_to\n";

my $defined = 'baz';
my $hashref = { 'key' => 'value'};
# hash causes warning, probably because it doesn't do autovivification
#my $hash = ( 'key' => 'value');

sub test {
    return {
        'foo' => 'bar',
        'bar' => $defined,
        'baz' => $undefined,
        'buz' => $hashref->{'key'},
        'biz' => $hashref->{'unknown'},
#        'hbuz' => $hashref->{'key'},
#        'hbiz' => $hashref->{'unknown'},
    };
}

use Data::Dumper;

print "No warnings: " . Dumper(test()) . "\n";
