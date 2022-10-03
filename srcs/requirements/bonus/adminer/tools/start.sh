#!/bin/bash

echo "Setting up...";
mkdir -p /var/www/html/;
mkdir -p /run/php;
echo "Downloading adminer...";
wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
-O /var/www/html/adminer.php && echo "Adminer downloaded successfully ";

echo "launching php service!";
/usr/sbin/php-fpm7.3 -F;