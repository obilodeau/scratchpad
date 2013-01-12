#!/usr/bin/python

# related: http://stackoverflow.com/questions/36932/whats-the-best-way-to-implement-an-enum-in-python
class Worker():

    SUCCESS = 1
    FAILURE = 2

    def test(self):
        return Worker.FAILURE

t = Worker()
t.test()

if (t.test() == Worker.FAILURE):
    print("I got a failure status")

if (t.test() == Worker.SUCCESS):
    print("I got a success status")
