#!/usr/bin/python

import pprint

tests = [
    "foo, bar",
    "foo,bar",
    "foo  ", "bar , "
    ]

for t in tests:
    # w/o stripping
    pprint.pprint(t.split(","))

    # w/ stripping
    z = [x.strip() for x in t.split(',')]
    pprint.pprint(z)
