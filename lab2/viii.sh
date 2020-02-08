#!/bin/bash

# Создать файл в который поместить имена файлов в dir /var/log через двойное пространство

out="viii.out"
echo "" > "$out"
for file in /var/log/*
do

	if [ -f $file ] 
	then
		echo "$file" >> "$out"
		echo "" >> "$out"
	fi
done
 
