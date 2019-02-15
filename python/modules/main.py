# works
from ext import library
library.some_call()

# doesn't work
#from ext import ext
#e = Ext()
#e.show()

# works
from ext import ext
e = ext.Ext()
e.show()

# also works
from ext.ext import Ext
e = Ext()
e.show()
