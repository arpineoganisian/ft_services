#!/bin/bash

db_name='wordpress'
username='arpine'

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

# создание базы данных
mysql -e "CREATE DATABASE $db_name;"
# команда GRANT - eсли Вы даете привилегии пользователю, который не существует, он будет автоматически создан
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'%' IDENTIFIED BY 'arpine' WITH GRANT OPTION;"
# значение '%' в поле Host означает любое имя хоста
mysql -e "FLUSH PRIVILEGES;"

# запись б.д. с юзерами в только что созданную бд 
mysql -uroot wordpress < wordpress.sql
rc-service mariadb stop
exec mysqld_safe