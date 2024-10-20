#!/bin/bash
# 1. Выводим текущее значение переменной PATH
echo "Текущее значение PATH: $PATH"
# 2. Добавляем домашнюю директорию текущего пользователя в PATH
HOME_DIR="$HOME"
export PATH="$HOME_DIR:$PATH"
echo "Новое значение PATH: $PATH"
# 3. Создаем файл assignment_10_internal_script.sh в домашней директории
SCRIPT_FILE="$HOME_DIR/assignment_10_internal_script.sh"
echo 'echo "Content of internal script"' > "$SCRIPT_FILE"
# 4. Даем файлу права на исполнение для пользователя-владельца
chmod u+x "$SCRIPT_FILE"
# 5. Запускаем созданный файл
"$SCRIPT_FILE"
# 6. Восстанавливаем значение PATH как былоunset PATH
export PATH="$PATH"
# 7. Попытка запустить скрипт снова
echo "Попытка запустить скрипт снова...""$SCRIPT_FILE"
