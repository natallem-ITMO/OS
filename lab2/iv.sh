#!/bin/bash

#Найти в директории /bin все файлы, которые являются сценариями, и вывести на экран полное имя файла с интерпретатором, наиболее часто используемым в этих сценариях (только полное имя файла).

out="iv.out"
top="iv_2.out"
echo "" > $out


for file in /bin/*
do
	if [ -f $file ] 
	then 
		if head -1 $file | egrep -q "^#!"
		then 	
			line=$(head  -n 1 "$file")
			first="${line:0:2}"	
		echo ${line:2} >> "$out"
		fi
	fi
done

grep -o -h -E "^[^ ]+" "$out" | sort | uniq -c | sort  -nr > "$top"
line=$(head -n 1 "$top")
a=($line)
echo ${a[1]}
