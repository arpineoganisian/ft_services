#!/bin/bash

db_name='wordpress'
username='arpine'

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "CREATE DATABASE $db_name;"

# создание нового пользователя с помощью команды GRANT
# eсли Вы даете привилегии пользователю, который не существует, он будет автоматически создан
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'%' IDENTIFIED BY 'arpine' WITH GRANT OPTION;"
# значение '%' в поле Host означает любое имя хоста

#mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"

mysql -e "FLUSH PRIVILEGES;"

mysql -uroot wordpress < wordpress.sql
rc-service mariadb stop
exec mysqld_safe

# --execute (or -e) option  can be used with mysql to pass one or more semicolon-separated SQL statements to the server