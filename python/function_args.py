#!/usr/bin/python

predefined_var = 'bar'


# amazingly, this works!
# NOTE: with the important limitation that predefined_var can't be changed
def w_var(a='foo', b=predefined_var):
    print "a = {} and b = {}".format(a, b)

def spit_val():
    return 'barcamp'

# and even this!
# NOTE: b= is defined on parsing time, if spit_val changes behavior b's default
# value isn't updated
def w_call(a='foo', b=spit_val()):
    print "a = {} and b = {}".format(a, b)

w_var()
w_call()
