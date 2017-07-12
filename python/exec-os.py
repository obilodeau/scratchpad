#!/usr/bin/env python

import subprocess
# Seems that the subprocess module is the way to go
# http://stackoverflow.com/questions/89228/calling-an-external-command-in-python
# See malboxes' code for a relatively complex example

subprocess.call(["ls", "-l"])
output = subprocess.check_output(["echo", "Hello World!"])
print(output.decode('ascii'))
