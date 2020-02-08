#!/bin/bash

#Подсчитать общее количество строк в файлах, находящихся в директории /var/log/ и имеющих расширение log.

in="/var/log"
res=0

for file in `find "$in" -type f -name "*.log"`
do
	line=$(wc -l "$file")
	a=( $line )
	num="${a[0]}"
	let res=$res\+$a
done

echo $res;
