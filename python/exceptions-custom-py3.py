#!/usr/bin/env python3

# Problem: I'm trying to add context to a generic and unexpected exception
#          while keeping the original traceback and exception information
#
# Turns out in python 3 this is very simple


def this_throws():
    return 1/0


# define a custom exception
class AugmentedException(Exception):
    pass


try:
    line_number = 123
    this_throws()
except Exception as e:
    context = "Crash at line no: {}".format(line_number)
    raise AugmentedException(context) from e
