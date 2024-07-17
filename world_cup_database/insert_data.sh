#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Limpar os dados existentes nas tabelas
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

# Ler o arquivo CSV e inserir os dados nas tabelas
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Ignorar a linha de cabeçalho
  if [[ $YEAR != "year" ]]; then
    # Inserir os times na tabela teams se ainda não existirem
    for TEAM in "$WINNER" "$OPPONENT"
    do
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")
      if [[ -z $TEAM_ID ]]; then
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]; then
          echo "Inserted team: $TEAM"
        fi
      fi
    done
    
    # Obter os team_ids
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # Inserir os dados na tabela games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]; then
      echo "Inserted game: $YEAR $ROUND - $WINNER vs $OPPONENT"
    fi
  fi
done