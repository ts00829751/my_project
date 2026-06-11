#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
  if [[ $1 =~ [0-9]+ ]]
  then
    NUM_EXIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
    if [[ $NUM_EXIST ]]
    then
      echo "$NUM_EXIST" | while IFS='|' read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  elif [[ $1 =~ ^[A-Z][a-z]*$ ]]
  then
    SYMBOL_EXIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
    NAME_EXIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE NAME = '$1'")
    if [[ $SYMBOL_EXIST ]]
    then
      echo "$SYMBOL_EXIST" | while IFS='|' read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    elif [[ $NAME_EXIST ]]
    then
      echo "$NAME_EXIST" | while IFS='|' read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  else
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi


