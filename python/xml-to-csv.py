#!/usr/bin/env python3
import csv
import sys

from bs4 import BeautifulSoup as Soup


with open('output.csv', 'w') as csvfile:
    fields = ['name', 'description']
    obs_writer = csv.DictWriter(csvfile, fieldnames=fields, quoting=csv.QUOTE_ALL)
    obs_writer.writeheader()

    files = sys.argv[1:]
    for _f in files:
        s = Soup(open(_f), 'xml')

        content = {}
        for node in s.select('content'):
            content['name'] = node.select('name')[0].contents[0].rstrip()
            content['description'] = node.select('description')[0].contents[0].rstrip()

        obs_writer.writerow(content)
