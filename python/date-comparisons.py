#!/usr/bin/python

from datetime import datetime, timedelta
import time
import os

print "Let's learn about python's date/time objects!"
print "Now: {}".format(datetime.now())
print "Now in unix timestamp: {}".format(time.mktime(datetime.now().timetuple()))
print "Now minus ~3 months: {}".format(datetime.now() - timedelta(days = 90))

past = datetime.now() - timedelta(days = 90)
print "and its unix timestamp: {}".format(time.mktime(past.timetuple()))
print ""

print "Lets compare w/ filesystem timestamps now!"
print "What is my own timestamp? {}".format(os.path.getmtime(__file__))

print "Can I compare with datetime object directly?"
# Not like this..
# if past > os.path.getmtime(__file__):

# but like this
if past > datetime.fromtimestamp(os.path.getmtime(__file__)):
    print "This file is OLD!"
else:
    print "This file is recent!"
