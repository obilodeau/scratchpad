#!/usr/bin/python

class TestClass():
    """wrawrawra"""
    def __init__(self):
        pass

    def context(self):
        print("doc string: %s" % self.__doc__)
        print("class: %s" % self.__class__)
        print("class name: %s" % self.__class__.__name__)
        print("class name?: %s" % __name__)
        print("module: %s" % self.__module__)
        print("file: %s" % __file__)

t = TestClass()
t.context()
