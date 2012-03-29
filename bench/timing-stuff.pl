#!/usr/bin/perl 

use strict;
use warnings;

# taken from http://www.perlmonks.org/?node_id=562117
# assuming OSS compliant license since very little value in the actual code
use Time::HiRes;
use Benchmark qw(:all) ;

# Use Perl code in strings...
cmpthese(-1, {
        'interval' => sub { my $t0 = [Time::HiRes::gettimeofday];
                         my $elapsed = Time::HiRes::tv_interval($t0)}
        ,
        'HiRes::time' => sub { my $t0 = Time::HiRes::time();
                         my $elapsed = Time::HiRes::time() - $t0;
        },
        'buitin time()' => sub { my $t0 = time;
                         my $elapsed = time - $t0;
        },
});
