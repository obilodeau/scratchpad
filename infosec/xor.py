def xor(*args):
    """XOR strings of arbitrary size together. Multiple strings supported"""
    return ''.join(map(chr, [ reduce(lambda x,y: x ^ y, map(lambda x: ord(x[i % len(x)]), args)) for i in xrange(max(map(len, args))) ] ))
