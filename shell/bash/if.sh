#!/bin/bash -x

echo if with an or inside
if [ "z$1" == "z" ] || [ "z$2" == "z" ]; then
	echo inside if
fi

echo numeric with newline
if [ `echo 8` == 8 ]; then
	echo inside if
fi
