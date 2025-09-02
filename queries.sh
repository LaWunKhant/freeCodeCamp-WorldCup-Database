#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "SELECT SUM(winner_goals) FROM games;")"

echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games;")"

echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")"

echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games;")"

echo "$($PSQL "SELECT MAX(winner_goals) FROM games;")"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id = (SELECT winner_id FROM games WHERE year = 2018 AND round = 'Final');")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT winner_id FROM games WHERE year = 2014 AND round = 'Eighth-Final') OR team_id IN (SELECT opponent_id FROM games WHERE year = 2014 AND round = 'Eighth-Final') ORDER BY name;")"

echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON teams.team_id=games.winner_id WHERE games.winner_id IS NOT NULL ORDER BY name;")"

echo "$($PSQL "SELECT T1.year, T2.name FROM games AS T1 JOIN teams AS T2 ON T1.winner_id=T2.team_id WHERE T1.round='Final' ORDER BY T1.year;")"

echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%';")"