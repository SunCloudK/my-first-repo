#!/bin/bash

function file_count {
  echo $(ls -1 | wc -l)
}

echo "Welcome to the Guessing Game!"
echo "Can you guess how many files are in the current directory?"

correct_count=$(file_count)

while true; do
  echo -n "Enter your guess: "
  read guess
  
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  if [[ $guess -lt $correct_count ]]; then
    echo "Too low! Try again."
  elif [[ $guess -gt $correct_count ]]; then
    echo "Too high! Try again."
  else
    echo "Congratulations! You guessed it correctly."
    break
  fi
done
