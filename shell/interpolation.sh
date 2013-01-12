#!/bin/sh

# doesn't work
#VAR=SOMETHING-$INTERPOLATED

VAR=SOMETHING-\$VAR2

VAR2=INTERPOLATED

# doesn't work
#echo $VAR

#works
eval echo $VAR

# also works
NEW=`eval echo $VAR`
echo $NEW
