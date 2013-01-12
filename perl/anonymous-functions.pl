#!/usr/bin/perl

sub test {
	my $coderef = shift;

	for (my $i = 0; $i < 5; $i++) {
		print &$coderef( $i ) . "\n";
	}
}

#test( sub { my $pos = shift; return (3 * $pos); } );
test( sub { return (3 * shift); } );
