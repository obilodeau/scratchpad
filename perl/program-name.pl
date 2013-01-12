#!/usr/bin/perl 

use strict;
use warnings;

# althought $0 never mentions perl. 
# pgrep/pidof doesn't match program-name if it's started with either perl $0 or perl -d $0
#do_something();
sub do_something {
    while (1) {
        print "My name is $0\n";
        sleep(1);
    }
}

# that is, unless we set $0
#$0 = 'program-name';
#do_something();

# and what would be a clean way to do that?
use File::Basename qw(basename);
$0 = basename($0);
do_something();
