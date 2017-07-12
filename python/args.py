#!/usr/bin/python

import sys

# for complex work use argparse 

# argv[0] is scriptname the rest are args
print sys.argv[1]

# this seems cool also (a la perl -n ..)
import fileinput
for line in fileinput.input():
    print fileinput.filename()
    fileinput.nextfile()
