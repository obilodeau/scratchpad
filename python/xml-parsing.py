#!/usr/bin/env python
#
# XML style parsing with CSS Selector style access
#
# context: extract assets from pitivi montage files
import sys

from bs4 import BeautifulSoup as Soup

s = Soup(open(sys.argv[1]), 'xml')

# extract all asset-id attributes of the clip nodes in the given XML file
for node in s.select('clip'):
    print(node['asset-id'].replace('file://', ''))
