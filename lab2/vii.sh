#!/bin/bash

#Вывести три наиболее часто встречающихся слова из man по команде bash длиной не менее четырех символов.

man bash | tr ' ' '\n' | tr '-' '\n' | grep -o -E "[[:alpha:]]{4}[[:alpha:]]*" | sort | uniq -c | sort -nr | head -n 3 |
while read line
do
	a=( $line )
	echo "${a[1]}"
done 

