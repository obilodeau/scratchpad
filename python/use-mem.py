#!/usr/bin/env python3
#
# Consumes a lot of memory

import os
import random
import time
import sys

time.sleep(random.random() * 15)

# large alloc
a = bytearray(1024000000)

# mem increments
b = {}
for i in range(10):
    b[i] = bytearray(100000000)
    time.sleep(1)

time.sleep(5)
print("seq {} / pid {}".format(sys.argv[1], os.getpid()))

