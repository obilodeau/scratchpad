#!/bin/bash

declare -A A

A=( ["B"]="X" ["C"]="Y" )

echo "${A["B"]}"
