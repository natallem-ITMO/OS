#!/bin/bash

read cur
memory=""
while [[ $cur != "q" ]]
do
memory="$memory $cur"
read cur
done
echo $memory
