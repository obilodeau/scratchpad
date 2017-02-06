#!/usr/bin/env perl
#
use strict;
use warnings;

opendir(my $dh, '/proc') || die;
while(readdir $dh) {
    print "/proc/$_\n";
}
closedir $dh;

