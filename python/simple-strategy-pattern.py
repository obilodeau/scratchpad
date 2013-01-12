#!/usr/bin/python

class Techniques():

    @staticmethod
    def technique1():
        print "using the awesome tech1"

    @staticmethod
    def technique2():
        print "using the awesomier tech2"

print """looking for a simple way to keep several implementation logically
grouped together without separating them into their own file"""

my_technique = Techniques.technique1
my_technique()

my_technique = Techniques.technique2
my_technique()
