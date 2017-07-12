#!/usr/bin/python

import csv
import sys

# tab separated value dialect
csv.register_dialect('tsv', delimiter="\t", quoting=csv.QUOTE_NONE)

with open(sys.argv[1], 'rb') as f:
    reader = csv.reader(f, 'tsv')
    for row in reader:
        print row
