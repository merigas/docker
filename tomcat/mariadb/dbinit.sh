#!/bin/bash

mysql_install_db --user=mysql --ldata=/var/lib/mysql/

/usr/bin/mysqld_safe &
mysql_pid=$!

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

mysql < /create.sql
mysql -e "GRANT ALL ON *.* TO student@'%' IDENTIFIED BY 'student' WITH GRANT OPTION"
mysqladmin shutdown
wait $mysql_pid
