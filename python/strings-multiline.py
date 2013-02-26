#!/usr/bin/python

# trying to keep log messages within 80 chars I often face a string concat
# problem
# via http://stackoverflow.com/questions/2504411/proper-indentation-for-python-multiline-strings

print "no candy :("
str1 = """line one
       line two
       line three"""
print str1

print "\nimplicitly joined"
str2 = ("this is an "
        "implicitly joined "
        "string")
print str2

print "\ntextwrap.dedent()"
import textwrap
str3 = textwrap.dedent("""\
        -----------------------------------------------
        |Doing whatever I want w/ multi-line string   |
        |and still it gets out without pre-indentation|
        |                                             |
        |        Thank you textwrap.dedent()!         |
        -----------------------------------------------
        Oh and I can
            indent still! :)""")
print str3
