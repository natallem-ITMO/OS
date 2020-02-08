#!/bin/bash

#Создать файл emails.lst, в который вывести через запятую все адреса электронной почты, встречающиеся во всех файлах директории /etc.

in="/etc/"
out="emails.lst"

grep -o -a -h -d recurse -E "[[:alnum:]]+@[[:alpha:]]+\.[[:lower:]]+" "$in" | sort | uniq | tr '\n' ','  > "$out"

