#!/usr/bin/perl 

#
# Warning: See attribute-builders for a cleaner way to do this.
#
package Person;
use Moose;

use 5.12.0;

has 'name' => (is => 'ro', isa => 'Str', required => 1);

sub meet {
    my ($self) = @_;

    say "Hello I am $self->{name}";
}

__PACKAGE__->meta->make_immutable;

package GreatPerson;
use Moose;

extends 'Person';

has 'name' => (is => 'ro', default => 'Olivier');

no Moose;
__PACKAGE__->meta->make_immutable;

package main;

use 5.12.0;

my $a = Person->new( 'name' => 'test' );
my $b = GreatPerson->new;

say "a: $a->{name}";
say "b: $b->{name}";
$b->meet();
