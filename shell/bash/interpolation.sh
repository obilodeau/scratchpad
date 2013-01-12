#!/bin/bash

echo "testing out bash interpolation"

VAR=variable

echo "string interpolation of $VAR"

echo `echo backtick interpolation of \$VAR`
