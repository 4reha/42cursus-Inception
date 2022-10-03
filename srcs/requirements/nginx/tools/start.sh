#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -newkey rsa:4096 -x509 -nodes -days 365  \
		-out /etc/ssl/certs/nginx.crt \
		-keyout /etc/ssl/private/nginx.key \
		-subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337 Coding School/OU=Education/CN=ael-hadd.42.fr";
echo "Nginx: ssl is set up!";
fi

nginx -g 'daemon off;';