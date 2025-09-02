#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "SELECT SUM(winner_goals) FROM games;")"

echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games")"

echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")"

echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games;")"

echo "$($PSQL "SELECT MAX(winner_goals) FROM games;")"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

echo "$($PSQL "SELECT COUNT(DISTINCT winner_id) FROM games;")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id=(SELECT winner_id FROM games WHERE round='Final' AND year=2018);")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT opponent_id FROM games WHERE round='Final' AND year=2014);")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT winner_id FROM games WHERE year=2014) AND team_id IN (SELECT winner_id FROM games WHERE year=2018);")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT team_id FROM teams FULL JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year=2014);")"

echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON teams.team_id=games.winner_id WHERE round='Eighth-Final';")"

echo "$($PSQL "SELECT round, COUNT(*) FROM games GROUP BY round ORDER BY COUNT(*) DESC LIMIT 1;")"

echo "$($PSQL "SELECT year, round, winner_goals, opponent_goals, name AS winner FROM games JOIN teams ON games.winner_id = teams.team_id WHERE round='Final';")"

echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON teams.team_id = games.winner_id WHERE name LIKE 'Co%';")"

echo "$($PSQL "SELECT DISTINCT(name) FROM teams WHERE name LIKE '%ia';")"
