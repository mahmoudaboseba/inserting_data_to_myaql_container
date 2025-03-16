#!/bin/bash

# Database credentials
DB_HOST="supermarket_db"
DB_USER="mahmoud"
DB_PASS="1234"
DB_NAME="supermarket"
DATA_FILE="/docker-entrypoint-initdb.d/customers.csv"
# Import data into the database
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "
LOAD DATA INFILE '$DATA_FILE'
INTO TABLE customer_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(customer_id, customer_name, customer_email)
SET customer_email = IF(customer_email = '', NULL, customer_email);
"

echo "Data import completed successfully!"

