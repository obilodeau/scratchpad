#!/usr/bin/perl

use strict;
use warnings;


sub list_set {
	my ($counting_coderef) = @_;

	for (my $i=0; $i<=10; $i++) {
		print &$counting_coderef($i)." ";
	}
	print "\n";
}

list_set( sub { my $pos = shift; return (2 * $pos + 5); } );

list_set( sub { my $pos = shift; return ($pos**2 + 5); } );
