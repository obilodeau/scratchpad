#!/usr/bin/perl

use strict;
use warnings;

use Net::POP3;

my $delete_up_to = 1;

my $pop = Net::POP3->new(Host => "localhost:55555");

print "BE VERY CAREFUL, THIS THING WILL DELETE EMAILS!!!\n";
if ($pop->login("LOGIN", "PASSWORD") > 0) {
    my $msgnums = $pop->list; # hashref of msgnum => size
    my $nbmsg = scalar (keys %{$msgnums});
    print "I have $nbmsg messages\n";

    #foreach my $msgnum (keys %$msgnums) {
    #    my $msg = $pop->get($msgnum);
    #    print @$msg;
    #    $pop->delete($msgnum);
    #}

    print "first on top is...\n";
    print @{$pop->get(1)};
    print "delete the first $delete_up_to messages\n";
    for (my $i = 0; $i < $delete_up_to; $i++) {
        print "Deleting $i..\n";
        $pop->delete($i);
    }
} 
else {
    print "Auth failed!\n";
}

$pop->quit;
