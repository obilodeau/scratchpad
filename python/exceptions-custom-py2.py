#!/usr/bin/env python2

# Python 2
#
# Problem: I'm trying to add context to a generic and unexpected exception while
#          keeping the original traceback and exception information
#

import sys

def this_throws():

    return 1/0

#this_throws()

# this doesn't work
#try:
#    this_throws()
#except Exception as e:
#    e.message = "We did something moronic. Original exception message: " + e.message
#    raise
#

class AugmentedException(Exception):
    def __init__(self, original_exception, context):
        self.original = original_exception
        self.context = context

# Never got this to work
#try:
#    this_throws()
#except Exception as e:
#    type, value, traceback = sys.exc_info()
#    raise AugmentedException(e, "some value add"), ("test", type, value), traceback

try:
    this_throws()
except Exception as e:
    type, value, traceback = sys.exc_info()
    raise Exception, ("some value add", type, value), traceback
