#!/bin/bash

#Для каждого процесса посчитать разность резидентной и разделяемой части памяти процесса (в страницах). Вывести в файл строки вида PID:разность, отсортированные по убыванию этой разности.

out="output_iv.txt"
ps -eo pid | 
tail -n +2 | 
while read line
do
	file="/proc/$line/statm"
	if [ -f $file ] 
		then 
		a=($(head "$file"))
		resident="${a[1]}"
		shared="${a[2]}"
		let diff=$resident\-$shared
		echo "$line:$diff"
	fi
done |
sort -rn -k2 -t":" > $out;

