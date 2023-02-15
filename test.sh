#!/bin/bash

SQL_USER="root"
SQL_PASS="root"
SQL_HOST="localhost"

PORTS=("3306" "3316" "3326")

for i in "${PORTS[@]}"
do
	echo "Testing Server on Port $i..."
	#mysqlslap --user=$SQL_USER --password=$SQL_PASS --host=$SQL_HOST --port=$i --protocol=tcp --auto-generate-sql --concurrency=100 --number-of-queries=10000 --verbose
	time mysqlslap --user=$SQL_USER --password=$SQL_PASS --host=$SQL_HOST --port=$i --protocol=tcp concurrency=50 --iterations=100 --number-int-cols=5 --number-char-cols=20 --auto-generate-sql --verbose
done
