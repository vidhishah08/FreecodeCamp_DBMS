#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY" > /dev/null

# Read every row from games.csv
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the CSV header
  if [[ $YEAR != "year" ]]
  then
    # Add the winner if it is not already in teams
    $PSQL "INSERT INTO teams(name)
    VALUES('$WINNER')
    ON CONFLICT(name) DO NOTHING" > /dev/null

    # Add the opponent if it is not already in teams
    $PSQL "INSERT INTO teams(name)
    VALUES('$OPPONENT')
    ON CONFLICT(name) DO NOTHING" > /dev/null

    # Get the IDs dynamically from the teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Insert the game
    $PSQL "INSERT INTO games(
      year,
      round,
      winner_id,
      opponent_id,
      winner_goals,
      opponent_goals
    )
    VALUES(
      $YEAR,
      '$ROUND',
      $WINNER_ID,
      $OPPONENT_ID,
      $WINNER_GOALS,
      $OPPONENT_GOALS
    )" > /dev/null
  fi
done < games.csv