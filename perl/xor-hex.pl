#!/usr/bin/perl 

use strict;
use warnings;

# ???????? ???????? ???????? 00??????
# ECC84541 ECC84541 ECC84541 ECC84541
# ===================================
# 8ED8513D 98B66AFE 8D671597 00E13E13 x 4 = 120 bit

#
# XXX this doesn't work... don't rely on it, I used python inside IDA instead
#

# result string
my @a = (0x8ED8513D, 0x98B66AFE, 0x8D671597, 0x00E13E13);
# result string reversed
#my @a = (0x3D51d88e, 0xFE6ab698, 0x9715678d, 0x133ee100, 0x62624646, 0x8eaa0307);
# ABC...
#my @a = (0xa88b0700, 0xa48f0007, 0xA0830f08, 0xEC870B0C);
# FFF...
#my @a = (0xaa8e0307);
# wAAAxAAAyAAAzAA
#my @a = (0x41414177, 0x41414178, 0x41414179, 0x0041417a);
#my $b = 0xECC84541;
#my $b = 0x1337babe;
my $b = 0xbeba3713;

foreach (@a) {
    my $xored = $_ ^ $b;
    printf("hex: 0x%0x\n", $xored);

    $xored = sprintf('%0x', $xored);
    $xored =~ s/([0-9a-fA-F]{2})/chr(hex($1))/eg;
    printf("ascii: %s\n", $xored);
}
