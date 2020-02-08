#!/bin/bash

#Вывести список пользователей системы с указанием их UID, отсортировав по UID. Сведения о пользователей хранятся в файле /etc/passwd. В каждой строке этого файла первое поле – имя пользователя, третье поле – UID. Разделитель – двоеточие.

in="/etc/passwd"
out="v.out"

while read line
do
	line=$(echo $line | tr ":" " ")
	a=( $line )
	nline="${a[2]} ${a[0]}"
	echo $nline >> "$out"
done < "$in"
sort -nr "$out" | uniq 

