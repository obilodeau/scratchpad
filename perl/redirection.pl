#!/usr/bin/perl

print `echo stdout out`;
print "not printing: \n", `bleh`;
print "printing: \n", `bleh 2>&1`;
print "printing: $!\n";

