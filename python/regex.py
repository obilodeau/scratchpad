#!/usr/bin/python

import re

def match(haystack):
    m = re.search('.*?(\S+)\s\*\/', haystack)
    print "bad re matched: " + m.group(1)
    m = re.search('.*?(\S+)\s(?:COLLATE.*)?\*\/', haystack)
    print "good re matched: " + m.group(1)

match("CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 */")
match("CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */")
