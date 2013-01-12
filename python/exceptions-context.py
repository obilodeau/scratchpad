#!/usr/bin/python

# I was wondering if we can access variables inside a for loop from the except
# block
def exception_scoping():

    try:
        for i in range (1, 5):
            print "happily derpin' {}...".format(i)
            if (i == 3):
                raise

    except Exception as e:
        print "oh nooes!"
        print 'i equals {}'.format(i)

exception_scoping()
