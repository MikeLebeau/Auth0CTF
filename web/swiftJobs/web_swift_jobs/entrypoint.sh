#!/bin/ash

/usr/bin/mysqld --user=root --bind-address=127.0.0.1 --port 3306 &

# wait for mysql to start
sleep 5

# Setup MySQL Database
DBPASS=$(echo azerty | md5sum | head -c 15)
mysql -e "DROP DATABASE test; CREATE DATABASE jobsdb"
mysql -e "CREATE USER 'dbuser'@'localhost'"
mysql -e "GRANT ALL PRIVILEGES ON jobsdb.* To 'dbuser'@'localhost' IDENTIFIED BY 'azerty';"
sed -i "s/DBPASS/azerty/g" /app/database.js
mysql jobsdb < /app/database.sql
rm -rf /app/database.sql

/usr/bin/supervisord -c /etc/supervisord.conf
