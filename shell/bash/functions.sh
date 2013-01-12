#!/bin/bash

function testing () {
	echo "method call test params passed: $1 $2"
	echo "global var: $TEST"
	return 25
}

testing elephant pantoufle
testing juste-un
testing
TEST="exists"
testing enabled-global
if [[ "$?" == "25" ]]; then
	echo "expected result"
fi
