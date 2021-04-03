#!/bin/bash

db_name='my_database'
username='root'
hostname='localhost'

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "CREATE DATABASE $db_name;"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"
mysql -e "FLUSH PRIVILEGES;"

mysql -uroot my_database < my_database.sql
rc-service mariadb stop
exec mysqld_safe

# --execute (or -e) option  can be used with mysql to pass one or more semicolon-separated SQL statements to the server