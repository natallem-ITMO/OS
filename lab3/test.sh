#!/bin/bash


a=23435.34
b=0.5
x=0.5
y=-1;
echo "y=$y"
RESULT=$(awk "BEGIN {printf \"%.6f\",${y}/${x}}")
echo $RESULT
