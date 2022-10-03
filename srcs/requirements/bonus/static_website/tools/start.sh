#!/bin/bash

echo "Setting up...";
mkdir -p /var/www/html/wordpress/static/;
echo "Moving files...";
mv /index.html /var/www/html/wordpress/static/;

echo "Done!, Your static website is now ready to serve.";