#!/usr/bin/perl 

use strict;
use warnings;

# trying to redo catalyst's stash variable
package c;

sub new {
    my ( $class, %argv ) = @_;

    # setting stash to anon empty hashref
    my $self = bless {'stash' => {} }, $class;
    return $self;
}

sub stash {
    my ( $self ) = @_;
    return $self->{'stash'};
}

package main;

my $c = c->new();

$c->stash->{'key'} = 'value';

$DB::single = 1;
