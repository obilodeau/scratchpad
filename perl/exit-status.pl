#!/usr/bin/perl 

use strict;
use warnings;

# fails
#exit(undef);

# fails also
#my $var = undef;
#exit($var);

# it seems undef is not an acceptable exit value (prints an error and exit status is 0)
