#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;


if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};
wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;

sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
#sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp redis enable --allow-root
echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F