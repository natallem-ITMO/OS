#!/bin/bash

 #Вывести в файл список PID всех процессов, которые были запущены командами, расположенными в /sbin/
out="output_iii.txt"
ps -eo pid,cmd,user,comm |awk '$2 ~ /^\/sbin\// {print $1}' > "$out"

