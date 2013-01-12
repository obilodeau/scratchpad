#!/bin/dash

DESC=$0

RETVAL=3
[ $RETVAL -eq 0 ] && echo "$DESC is running" 
[ $RETVAL -eq 1 ] && echo "$DESC is not running and the pid file exists"
[ $RETVAL -eq 3 ] && echo "$DESC is not running" 
[ $RETVAL -eq 4 ] && echo "$DESC  - unable to determine status" 
exit $RETVAL

