#!/bin/bash

#Для всех зарегистрированных в данный момент в системе процессов выведите в один файл строки ProcessID=PID : Parent_ProcessID=PPID : Average_Sleeping_Time=SleepAVG. Значения PPid и Pid возьмите из файлов status, значение  SleepAVG из файла sched поле avg_atom, которые находятся в директориях с названиями, соответствующими PID процессов в /proc . Отсортируйте эти строки по идентификаторам родительских процессов.

out="output_v.txt"
let a=0;
ps -eo pid | 
tail -n +2 | 
while read pid
do
	fileStatus="/proc/$pid/status"
	fileSched="/proc/$pid/sched"
	if [ -f "$fileStatus" ] && [ -f "$fileSched"  ]; then
		x=`awk '/^nr_switches/ {print $3}' $fileSched`
		y=`awk '/^se.sum_exec_runtime/ {print $3}' $fileSched` 
		ppid=`awk '/^PPid/ {print $2}' $fileStatus`
		if [ $x -eq 0 ]; then
			SleepAVG=-1
		else 
			SleepAVG=$(awk "BEGIN {printf \"%.6f\",${y}/${x}}")
		fi
		echo "$pid $ppid $SleepAVG"
		
	else 
		let a=$a\+1
	fi
done |
sort -n -k2 |
awk '{ print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Sleeping_Time="$3}' > $out


