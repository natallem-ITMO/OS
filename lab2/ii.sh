#!/bin/bash

#Создать full.log, в который вывести строки файла /var/log/Xorg.0.log, содержащие предупреждения и информационные сообщения, заменив маркеры предупреждений иинформационных сообщений на слова Warning: и Information:, чтобы в получившемся файлесначала шли все ошибки, а потом все предупреждения. Вывести этот файл на экран.iii) Создать файл emails.lst, в который вывести через запятую все адрес

input="/var/log/Xorg.0.log"
output="full.log"
replace1="WW"
toreplace1="Warning"
replace2="II"
toreplace2="Information"
grep   -E "] \($replace1\) " "$input" | sed "s/($replace1)/$toreplace1:/" > "$output"
grep   -E "] \($replace2\) " "$input" | sed "s/($replace2)/$toreplace2:/" >> "$output"

