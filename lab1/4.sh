#!/bin/bash
read b
let a=$b\%2
counter=1
while [[ $a -eq 1 ]]
do
read b
let a=$b\%2
let counter=$counter\+1
done

echo $counter

