#!/usr/bin/python

predefined_var = 'bar'


# amazingly, this works!
def w_var(a='foo', b=predefined_var):
    print "a = {} and b = {}".format(a, b)

def spit_val():
    return 'barcamp'

# and even this!
def w_call(a='foo', b=spit_val()):
    print "a = {} and b = {}".format(a, b)

w_var()
w_call()
