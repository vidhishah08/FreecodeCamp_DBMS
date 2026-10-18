#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';" )

if [[ -z $USER_ID ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
else
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID;")

BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID;")

echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUMBER_OF_GUSSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while true
do
((NUMBER_OF_GUESSES++))
if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
elif (( GUESS > SECRET_NUMBER ))
then
echo "It's lower than that, guess again:"
elif (( GUESS < SECRET_NUMBER ))
then
echo "It's higher than that, guess again:"
else
UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME';")
UPDATE_BEST=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME' AND (best_game IS NULL OR best_game > $NUMBER_OF_GUESSES);")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
break
fi
read GUESS
done
