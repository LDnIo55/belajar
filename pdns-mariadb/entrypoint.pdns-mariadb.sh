#!/bin/bash
set -e

service mysql start

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
  mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
  mysql -u root -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
  mysql -u root -e "FLUSH PRIVILEGES;"
fi

exec mysqld