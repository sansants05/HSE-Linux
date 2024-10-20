#!/bin/bash
# Проверка, что передан один аргумент (путь к файлу)
if [ $# -ne 1 ]; then
  echo "ERROR: Please provide a file path"
  exit 1
fi
# Проверка, существует ли файл
if [ ! -f "$1" ]; then
  echo "ERROR: File does not exist"
  exit 1
fi
# Подсчет слов в файле
word_count=$(wc -w < "$1")
# Вывод результата
echo "Words count: $word_count"
