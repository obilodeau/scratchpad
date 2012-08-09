#!/usr/bin/perl 
package TestString;
use Moose;

has 'test' => (is => 'ro', isa => 'Str');

no Moose;
__PACKAGE__->meta->make_immutable;

package main;

my $x = TestString->new( 'test' => 'this is a string' );

print "Doesn't work. x->test is: $x->test\n";
print "Doesn't work. x->test is: $x->test()\n";
print "Doesn't work. x->test is: {$x->test()}\n";
print "Doesn't work. x->test is: {$x->test}\n";
print "Works!!!!!!!! x->test is: $x->{test}\n";
