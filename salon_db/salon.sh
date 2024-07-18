#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SELECTION_MENU $SERVICE_ID_SELECTED ;;
    2) SELECTION_MENU $SERVICE_ID_SELECTED ;;
    3) SELECTION_MENU $SERVICE_ID_SELECTED ;;
    4) SELECTION_MENU $SERVICE_ID_SELECTED ;;
    5) SELECTION_MENU $SERVICE_ID_SELECTED ;;
    *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

SELECTION_MENU(){
  #recebe a seleção passada de MAIN_MENU_SELECTION, que está em $1
  SELECTION=$1
  #pega informação do usuário
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #verifica se o numero ja esta cadastrado (se estiver, já teremos o nome do cliente)
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #verifica caso o nome do cliente volte vazio do banco
  if [[ -z $CUSTOMER_NAME ]]
  then
    #nesse caso, vamos solicitar o nome do cliente, já que não temos cadastrado
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  #pergunta horário que o cliente marcará o appointment
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  #pega customer_id pelo numero de telefone
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #inserindo appointments no banco
  INSERT_CUSTOMER_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME', '$CUSTOMER_ID', '$SELECTION')")
  #nome do serviço selecionado pelo service_id
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SELECTION'")
  #mostrando o que foi marcado e horário para o cliente
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU