#!/usr/bin/python

print "catching!"
try:
    10 * (1/0)
except ZeroDivisionError:
    print "Y0/0 error"

print "exception attributes"
try:
    10 * (1/0)
except ZeroDivisionError as e:
    print e

print "Throwing!"
raise Exception("Ay ay ay!")
