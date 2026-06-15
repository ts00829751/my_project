#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM user_list WHERE name = '$USERNAME'")
if [[ $USER_ID ]]
then
  #add game played and min of num of guesses
  GAMES_INFO=$($PSQL "SELECT COUNT(user_id), MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID")
  echo "$GAMES_INFO" | while IFS='|' read PLAYED BEST
  do
    echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
  done
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO user_list(name) VALUES('$USERNAME')")
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS_NUM
COUNT=1
until [[ $GUESS_NUM = $NUMBER ]]
do
  (( COUNT += 1 ))
  if [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUM -gt $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read GUESS_NUM
    elif [[ $GUESS_NUM -lt $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read GUESS_NUM
    fi
  else
    echo "That is not an integer, guess again:"
    read GUESS_NUM
  fi
done

echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
USER_ID=$($PSQL "SELECT user_id FROM user_list WHERE name = '$USERNAME'")
INSERT_GAMES=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $COUNT)")
