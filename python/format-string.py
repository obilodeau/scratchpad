#!/usr/bin/python


#id = 123
id = "test"
# so !s in the following casts the argument as a string
print "SELECT * FROM elites WHERE id={0!s} LIMIT 1".format(id)
