#!/bin/bash
# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
  echo "ERROR: Please provide two numbers"
  exit 1
fi
# Check if both arguments are numbers using regex
if ! [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ $2 =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
  echo "ERROR: Please enter numbers" 
  exit 1
fi
# Calculate the sum
sum=$(echo "$1 + $2" | bc)
# Output the result
echo "The sum is: $sum"
