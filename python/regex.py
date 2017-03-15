#!/usr/bin/env python2

import re

def match(haystack):

    # group capture
    m = re.search('.*?(\S+)\s\*\/', haystack)
    print "bad re matched: {}".format(m.group(1))
    m = re.search('.*?(\S+)\s(?:COLLATE.*)?\*\/', haystack)
    print "good re matched: {}".format(m.group(1))

match("CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 */")
match("CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */")

# substitution
s = "some string"
s = re.sub(r' ', " wicked ", s)
print s

# short version
haystack = "foolish heart"
print re.match(r'^(.*)\s', haystack).group(1)
