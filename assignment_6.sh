#!/bin/bash 
 
# Функция для вычисления факториала 
factorial() { 
    local n=$1 
    if [ $n -le 1 ]; then 
        echo 1 
    else 
        echo $((n * $(factorial $((n - 1))))) 
    fi 
} 
 
# Функция для вычисления биномиального коэффициента C(n, k) 
binomial_coefficient() { 
    local n=$1 
    local k=$2 
    echo $(( $(factorial $n) / ( $(factorial $k) * $(factorial $((n - k))) ) )) 
} 
 
# Проверка, что передан аргумент 
if [ "$#" -gt 1 ]; then 
    echo "Error: you should use a positive integer as an argument" 
    exit 1 
fi 
 
# Получение размера треугольника 
if [ "$#" -eq 1 ]; then 
    if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then 
        echo "Error: you should use a positive integer as an argument" 
        exit 1 
    fi 
    rows=$1 
else 
    rows=5  # По умолчанию 5 строк 
fi 
 
# Генерация треугольника из биномиальных коэффициентов 
for ((n=0; n<rows; n++)); do 
    for ((k=0; k<=n; k++)); do 
        printf "%d" "$(binomial_coefficient $n $k)" 
        # Добавление четырех пробелов 
        printf "    " 
    done 
    # Переход на новую строку 
    printf "\n" 
done
