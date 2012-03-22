#!/usr/bin/perl 

use strict;
use warnings;

use Date::Format;

print time2str("%Y-%m-%d %H:%M:%S", time) . "\n";
