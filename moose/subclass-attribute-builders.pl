#!/usr/bin/perl 
package Person;
use Moose;

use 5.12.0;

has 'name' => (is => 'ro', isa => 'Str', required => 1, builder => '_my_name');

sub meet {
    my ($self) = @_;

    say "Hello I am $self->{name}";
}

__PACKAGE__->meta->make_immutable;

package GreatPerson;
use Moose;

extends 'Person';

sub _my_name { return 'Olivier' }

no Moose;
__PACKAGE__->meta->make_immutable;

package main;

use 5.12.0;

my $a = Person->new( 'name' => 'test' );
my $b = GreatPerson->new;
# doesn't work because _my_name() not defined in Person
#my $c = Person->new();

say "a: $a->{name}";
say "b: $b->{name}";
#say "c: $c->{name}";
$b->meet();
