#!/usr/bin/perl 

use strict;
use warnings;

use 5.12.0;

# Testing argument interpolation on the shell
# pass: ARG $VAR    get: ARG
# pass: ARG "$VAR"  get: ARG
# pass: ARG '$VAR'  get: ARG $VAR
# pass: ARG \$VAR   get: ARG $VAR
# pass: ARG "\$VAR" get: ARG $VAR
local $, = ' ';
say @ARGV;
