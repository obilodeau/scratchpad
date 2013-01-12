#!/usr/bin/python

def print_throw():
    print "Throwing!"
    raise Exception("Ay ay ay!")

# I was wondering if finally ran even if there's a return in try
def what_will_it_return():

    try:
        print "happily derpin'"
        #print_throw()
        #return "try"

    except Exception as e:
        print "oh nooes!"
        return 'except'

    finally:
        print "aah finally"
        # fun fact: a return in finally overrides a return in try
        #return 'finally'

    return "after try/except/finally"

print("and it returned value from: " + what_will_it_return())
