#!/bin/bash
# Проверка на наличие аргумента
if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите путь к файлу или директории для бекапа."
    exit 1
fi
SOURCE="$1"  # Исходный файл или директория
BACKUP_DIR="/var/backups"  # Директория для хранения бекапов
# Проверка существования исходного файла или директории
if [ ! -e "$SOURCE" ]; then
    echo "Ошибка: файл или директория '$SOURCE' не существуют."
    exit 1
fi
# Создание директории для бекапов, если она не существует
mkdir -p "$BACKUP_DIR"
# Получение имени файла/директории для бекапа
BASENAME=$(basename "$SOURCE")

# Формирование имени бекапа с текущей датой и временем
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="${BASENAME}_${TIMESTAMP}.tar.gz"
# Создание архива
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE")" "$BASENAME"
echo "Бекап '$SOURCE' сохранен как '$BACKUP_NAME'."
# Удаление старых бекапов (больше 5 версий)
cd "$BACKUP_DIR" || exitBACKUP_COUNT=$(ls "${BASENAME}_"*.tar.gz 2>/dev/null | wc -l)
if [ "$BACKUP_COUNT" -gt 5 ]; then
    # Находим и удаляем самые старые бекапы
    ls -t "${BASENAME}_"*.tar.gz | tail -n +6 | xargs rm -f
    echo "Удалены старые бекапы. Оставшиеся: $(ls "${BASENAME}_"*.tar.gz | wc -l)."
fi
exit 0
