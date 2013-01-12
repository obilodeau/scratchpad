#!/usr/bin/python

# technique #1: list only the class member variables w/o the metadata
class DataClass:
    instance_var = 'data'
    instance_var2 = 'more data'

    def __dir__(self):
        """Overrides dir() to return only public instance variables"""
        return [e for e in dir(DataClass) if e[0] != '_']


def debug(x):
    print (x)

print("dict: ") 
print(DataClass.__dict__)

print("dir(class): ")
print(dir(DataClass))

print("dir(instance): ")
a = DataClass()
print(dir(a))

print("vars(): ")
print(vars(DataClass))
print("")

# technique #2: through inspect
# Warning: This doesn't seem to work because str are internal values and not objects
import inspect
#print(inspect.getmembers(DataClass, predicate=is_public))
print("inspect.getmembers(): ")
print(inspect.getmembers(DataClass, predicate=debug))
