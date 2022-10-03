FROM debian:buster

RUN apt update && apt install -y nano php7.3 \
php-mysqli php-fpm wget

COPY ./tools/start.sh /usr/local/bin/

CMD [ "bash", "/usr/local/bin/start.sh" ]
