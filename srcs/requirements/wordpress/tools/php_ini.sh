#!/bin/bash

echo "Waiting for MariaDB to be ready..."
until mariadb-admin ping -h mariadb --user=$MYSQL_USER --password=$MYSQL_PASSWORD --silent; do 
    sleep 1
done

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root --path=/var/www/html


wp config create --allow-root --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb

wp core install --allow-root --path=/var/www/html --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email

wp user create --allow-root --path=/var/www/html $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

chown -R www-data:www-data /var/www/html



fi

mkdir -p /run/php

exec php-fpm8.2 -F