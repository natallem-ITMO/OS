#!/bin/bash

# Pid процессов  использующих библиотеку libc-2.5.so

pattern="libc-2.29.so" #библиотеки libc-2.5.so нету(((

ps -eo pid | 
tail -n +2 | 
while read pid
do
	fileMaps="/proc/$pid/maps"	
	if [ -f "$fileMaps" ]
	then
		sudo awk -v awkPid="$pid" 'BEGIN {flag=0} 
			/libc\-2\.29\.so/ {flag=1}
			END{if (flag==1) {print awkPid}}' $fileMaps	
	fi   
done 
