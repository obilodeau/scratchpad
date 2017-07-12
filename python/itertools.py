#!/usr/bin/env python

from itertools import cycle, starmap

def f(a,b):
    return chr(ord(a) + b)

def decrypt(strings):
    
    r = []
    for s in strings:
    
        b = [-2,-1,1]
        r.append("".join(starmap(f, zip(s,cycle(b)))))
    
    return r

# zip: think zipper of list a and b
# starmap: map but with extra params (IIRC)
# cycle: generates an iterator that will loop through the given list
