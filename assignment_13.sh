#!/bin/bash

# Проверка на наличие аргумента
if [[ $# -ne 1 ]]; then
    echo "Использование: $0 <путь_к_файлу_со_словами>"
    exit 1
fi

# Путь к файлу со словами
words_file="$1"

# Проверка на существование файла
if [[ ! -f "$words_file" ]]; then
    echo "Ошибка: файл '$words_file' не существует."
    exit 1
fi

# Инициализация переменных
score=0

# Основной цикл игры
while true; do
    # Выбор случайного слова из файла
    word=$(shuf -n 1 "$words_file")
    word_length=${#word}
    guessed_word=($(printf '_ %.0s' $(seq 1 $word_length)))
    attempts=6
    guessed_letters=()

    echo "Угадайте слово (длина слова: $word_length). У вас $attempts попыток."

    while [[ $attempts -gt 0 ]]; do
        # Показать текущее состояние угаданного слова
        echo "Слово: ${guessed_word[*]}"
        echo "Угаданные буквы: ${guessed_letters[*]}"

        # Ввод пользователя
        read -p "Введите букву: " letter

        # Проверка на ввод
        if [[ ! "$letter" =~ ^[a-zA-Z]$ ]]; then
            echo "Пожалуйста, введите одну букву."
            continue
        fi

        # Проверка, была ли буква уже угадана
        if [[ " ${guessed_letters[*]} " == *"$letter"* ]]; then
            echo "Вы уже угадывали эту букву."
            continue
        fi

        # Добавляем букву в список угаданных
        guessed_letters+=("$letter")

        # Проверка, есть ли буква в слове
        if [[ "$word" == *"$letter"* ]]; then
            echo "Правильно!"
            # Обновляем угаданное слово
            for (( i=0; i<${#word}; i++ )); do
                if [[ "${word:$i:1}" == "$letter" ]]; then
                    guessed_word[$i]="$letter"
                fi
            done
        else
            echo "Неправильно."
            attempts=$((attempts - 1))
            echo "Осталось попыток: $attempts"
        fi

        # Проверка, угадано ли слово
        if [[ "${guessed_word[*]}" == "${word//?/ }" ]]; then
            echo "Поздравляем! Вы угадали слово: $word"
            score=$((score + 1))
            break
        fi
    done

    # Проверка, проиграл ли игрок
    if [[ $attempts -eq 0 ]]; then
        echo "Вы проиграли. Загаданное слово: $word"
    fi

    echo "Текущий счет: $score"
    read -p "Хотите сыграть еще раз? (да/нет): " play_again
    if [[ "$play_again" != "да" ]]; then
        echo "Спасибо за игру! Ваш финальный счет: $score"
        exit 0
    fi
done
