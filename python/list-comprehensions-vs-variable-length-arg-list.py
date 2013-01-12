#!/usr/bin/python

from pprint import pprint

# trying to figure out some code I saw and need to change
key = "key"

things = (('key0', 'value0'), ('key1', 'value1'))

# list comprehensions
l = (key, [item[0] for item in things])
pprint(l)

# variable length argument list
def star_magic(key, *params):
        pprint(key)
        pprint(params)

star_magic(key, *[item[0] for item in things])
