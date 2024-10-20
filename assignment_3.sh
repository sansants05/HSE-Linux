#!/bin/bash
# Получение текущей даты и времени
current_datetime=$(date +"Current date and time: %a %b %d %I:%M:%S %p UTC %Y")
# Имя файла
filename="current_datetime.txt"
# Запись текущей даты и времени в файл
echo "$current_datetime" > "$filename"
# Вывод информации на экран
echo "$current_datetime"
