#!/bin/bash

STRING=package-2.2.0
#STRING=package-2.2.0-a2

echo $STRING
if [[ $STRING =~ ^package-([0-9.]+) ]]; then
	VERSION=${BASH_REMATCH[1]};
else
	VERSION=FAIL!
fi

echo $VERSION
