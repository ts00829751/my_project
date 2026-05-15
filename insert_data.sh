#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

INSERT_INTO_TEAMS() {
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      IS_WINNER_HERE=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
      IS_OPPONENT_HERE=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
      if [[ -z $IS_WINNER_HERE ]]
      then
        INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      elif [[ -z $IS_OPPONENT_HERE ]]
      then
        INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      fi
    fi
  done
}

INSERT_INTO_TEAMS

INSERT_INTO_GAMES() {
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
  done
}

INSERT_INTO_GAMES
