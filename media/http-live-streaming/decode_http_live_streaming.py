#!/usr/bin/env python
#
# PoC that decrypts the first block of an HTTP Live Streaming stream.
#
# Developed because I was unable to play the following link on my Linux laptop:
# http://www.rcinet.ca/fr/2015/12/18/pourquoi-les-djihadistes-ont-ils-un-avantage-technologique/
#
# Olivier Bilodeau <olivier@bottomlesspit.org>
#
# Implementation inspired by https://github.com/bvanheu/pytoutv
#
# In the end, throwing the m3u link into youtube-dl works to get the m4a 
# format so I didn't need to implement anything fancier than this PoC

from Crypto.Cipher import AES
import struct

key = open("aes128.key","rb").read()
output_file = open("plaintext.ts", "wb")

ts_file = open("segment1_1_a.ts", "rb").read()

count = 1
aes = AES.new(key, AES.MODE_CBC, struct.pack(">IIII", 0x0, 0x0, 0x0, count))

output_file.write(aes.decrypt(ts_file))
output_file.close()
