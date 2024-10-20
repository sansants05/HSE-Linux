#!/bin/bash

# Функция для выбора хода компьютера
get_computer_choice() {
    # Если игрок дважды подряд выбрал одно и то же, компьютер меняет выбор
    if [[ "$player_last_choice" == "$player_choice" ]]; then
        case "$player_choice" in
            "камень")
                echo "ножницы"  # Компьютер выбирает ножницы
                return
                ;;
            "ножницы")
                echo "бумага"  # Компьютер выбирает бумагу
                return
                ;;
            "бумага")
                echo "камень"  # Компьютер выбирает камень
                return
                ;;
        esac
    fi

    # Случайный выбор хода компьютера
    options=("камень" "ножницы" "бумага")
    echo "${options[RANDOM % 3]}"
}

# Функция для определения победителя
determine_winner() {
    if [[ "$player_choice" == "$computer_choice" ]]; then
        echo "Ничья!"
        return
    fi

    case "$player_choice" in
        "камень")
            [[ "$computer_choice" == "ножницы" ]] && player_score=$((player_score + 1)) && echo "Вы победили!" || computer_score=$((computer_score + 1)) && echo "Компьютер победил!"
            ;;
        "ножницы")
            [[ "$computer_choice" == "бумага" ]] && player_score=$((player_score + 1)) && echo "Вы победили!" || computer_score=$((computer_score + 1)) && echo "Компьютер победил!"
            ;;
        "бумага")
            [[ "$computer_choice" == "камень" ]] && player_score=$((player_score + 1)) && echo "Вы победили!" || computer_score=$((computer_score + 1)) && echo "Компьютер победил!"
            ;;
    esac
}

# Главная игра
echo "Добро пожаловать в игру 'Камень-ножницы-бумага'!"
read -p "Сколько побед нужно для завершения игры? " goal

player_score=0
computer_score=0
player_last_choice=""

while [[ $player_score -lt $goal && $computer_score -lt $goal ]]; do
    echo "Выберите: камень, ножницы или бумага:"
    read player_choice

    # Проверка на допустимый ввод
    if [[ ! "$player_choice" =~ ^(камень|ножницы|бумага)$ ]]; then
        echo "Неверный выбор! Пожалуйста, выберите камень, ножницы или бумага."
        continue
    fi

    # Получение выбора компьютера
    computer_choice=$(get_computer_choice)
    echo "Компьютер выбрал: $computer_choice"

    # Определение победителя
    determine_winner

    # Показ текущего счета
    echo "Текущий счет - Вы: $player_score, Компьютер: $computer_score"

    # Сохранение последнего выбора игрока
    player_last_choice="$player_choice"
done

# Вывод финального результата
if [[ $player_score -ge $goal ]]; then
    echo "Поздравляем! Вы выиграли игру!"
else
    echo "Компьютер победил. Лучше в следующий раз!"
fi
