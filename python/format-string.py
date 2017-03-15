#!/usr/bin/python


#id = 123
id = "test"
# so !s in the following casts the argument as a string
print "SELECT * FROM elites WHERE id={0!s} LIMIT 1".format(id)

print "multi-line format string tests"

print("this is an implicitly "
    "joined string "
    "with {} string in last component".format("format"))

print("this is an {} "
    "joined string "
    "with format string in first component".format("implicitly"))


print "there are {} things I like about python".format(2)
print "there are {:d} things I like about python".format(2)
print "there are {:b} things I like about python".format(2)

# MUST FUCKING DO!!
print "int: {0:d};  hex: {0:x};  oct: {0:o};  bin: {0:b}".format(42)

# with 0x, 0o, or 0b as prefix:
print "int: {0:d};  hex: {0:#x};  oct: {0:#o};  bin: {0:#b}".format(42)

# pretty hex
print "pretty hex: {0:04x};".format(42)

# pretty capitalized hex
print "pretty hex: {0:04X};".format(42)

# pretty bin
print "pretty bin: {0:08b};".format(42)

# number padding
print '{:02d}'.format(1)
