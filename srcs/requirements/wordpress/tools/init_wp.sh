#!/bin/bash
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --dbhost=${WP_DB_HOST} --allow-root
./wp-cli.phar core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root


#./wp-cli.phar core download --allow-root
#./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
#./wp-cli.phar core install --url=localhost --title=oupsi --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

php-fpm7.4 -F