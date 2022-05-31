#!/bin/bash



sed -i 's/$this->user="root";/$this->user="'${USER}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->pass="";/$this->pass="'${PASSWD}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->host="localhost";/$this->host="'${HOST}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->ddbb="";/$this->ddbb="'${DATABASE}'";/g' /var/www/html/core/controller/Database.php

mysql -u $USER --password=$PASSWD -h $HOST $DATABASE < /var/www/html/schema.sql



/usr/sbin/apache2ctl -D FOREGROUND
