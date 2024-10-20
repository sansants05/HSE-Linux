#!/bin/bash
# Проверка, что передан ровно один аргумент
if [ "$#" -ne 1 ]; then
    echo "Error: something went wrong"
    exit 1
fi
# Получение пути из аргумента
path="$1"
# Проверка, существует ли файл или директория
if [ -e "$path" ]; then
    if [ -d "$path" ]; then
        echo "It is directory"
    else
        echo "File exists"
    fi
else
    echo "File does not exist"
fi
