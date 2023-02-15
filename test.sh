#!/bin/bash

SQL_USER="root"
SQL_PASS="root"
SQL_HOST="localhost"

PORTS=("3306" "3307" "3308")

for i in "${PORTS[@]}"
do
	echo "Testing Server on Port $i..."
	mysqlslap --user=$SQL_USER --password=$SQL_PASS --host=$SQL_HOST --port=$i --protocol=tcp --auto-generate-sql --concurrency=100 --iterations=5 --verbose
done
