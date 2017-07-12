#!/bin/bash

declare -A A

A=( ["B"]="X" ["C"]="Y" )

echo "${A["B"]}"

A["D"]=patate

echo "${A[D]}"

echo
echo "Dumping all values"
for i in "${!A[@]}"
do
  echo "key  : $i"
  echo "value: ${A[$i]}"
done
