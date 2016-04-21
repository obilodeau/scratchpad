#!/bin/bash

SOURCE=$1
DEST=$2

find $SOURCE -name ".?*" -exec cp --recursive --link --parents '{}' $DEST \;

# then merging to a new destination is easy with gnome files
