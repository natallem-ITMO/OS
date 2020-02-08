#!/bin/bash

#Вывести на экран PID процесса, запущенного последним (с последним временем запуска).

ps -e -o pid,comm,etime --sort=+etime | awk 'NR==5  {print $1}'

