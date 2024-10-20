#!/bin/bash
# Генерация случайного числа от 0 до 100
target=$((RANDOM % 101))
max_attempts=10
attempts=0
echo "Я загадал число от 0 до 100. Попробуй угадать его!"
# Цикл для угадывания числа
while [ $attempts -lt $max_attempts ]; do
    read -p "Введите ваше число: " guess
    attempts=$((attempts + 1))
    # Проверка, является ли ввод числом
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Пожалуйста, введите целое число."
        attempts=$((attempts - 1))  # Не считаем эту попытку
        continue
    fi
    if [ "$guess" -eq "$target" ]; then
        echo "Поздравляю! Вы угадали число $target за $attempts попыток."
        exit 0
    elif [ "$guess" -lt "$target" ]; then
        echo "Ваше число меньше загаданного."
    else
        echo "Ваше число больше загаданного."
    fi
    # Если осталось попыток
    if [ $attempts -eq $max_attempts ]; then
        echo "Увы, вы не угадали число $target за $max_attempts попыток. Попробуйте еще раз!"
    fi
done
