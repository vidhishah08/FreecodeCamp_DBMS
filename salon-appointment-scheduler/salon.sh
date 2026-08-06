#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # Display all available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Read the selected service
  read SERVICE_ID_SELECTED

  # Check whether the selected service exists
  SERVICE_NAME=$($PSQL "
    SELECT name
    FROM services
    WHERE service_id = $SERVICE_ID_SELECTED;
  ")

  # Show the services again when an invalid service is selected
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nThat service does not exist. Please select a service:"
    MAIN_MENU
  else
    GET_CUSTOMER
  fi
}

GET_CUSTOMER() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "
    SELECT customer_id
    FROM customers
    WHERE phone = '$CUSTOMER_PHONE';
  ")

  # Add a new customer when the phone number does not exist
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_RESULT=$($PSQL "
      INSERT INTO customers(name, phone)
      VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');
    ")

    CUSTOMER_ID=$($PSQL "
      SELECT customer_id
      FROM customers
      WHERE phone = '$CUSTOMER_PHONE';
    ")
  else
    CUSTOMER_NAME=$($PSQL "
      SELECT name
      FROM customers
      WHERE customer_id = $CUSTOMER_ID;
    ")
  fi

  echo -e "\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "
    INSERT INTO appointments(customer_id, service_id, time)
    VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');
  ")

  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU