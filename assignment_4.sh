#!/bin/bash
# Проверка, что были переданы аргументы
if [ $# -eq 0 ]; then
    echo "Необходимо указать хотя бы один файл."
    exit 1
fi
# Имя архива
archive_name="$HOME/archive_$(date +%Y%m%d_%H%M%S).tar.gz"
# Массив для файлов, которые нужно добавить в архив
files_to_archive=()
# Проверка каждого файла
for file in "$@"; do
    if [ -f "$file" ]; then
        files_to_archive+=("$file")
    else
        echo "Файл $file не существует."
        exit 1
    fi
done
# Создание архива с файлами
if tar -czf "$archive_name" "${files_to_archive[@]}"; then
    echo "Архив успешно создан: $archive_name"
else
    echo "Ошибка при создании архива."
    exit 1 
fi
