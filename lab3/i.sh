#!/bin/bash

#Посчитать количество процессов, запущенных пользователем user, и вывести в файл пары PID:команда для таких процессов.

out="output_i.txt"
user="natalem"

ps -U "$user" eo pid,comm | tail -n +2 | awk ' {print $1":"$2} ' > "$out"


