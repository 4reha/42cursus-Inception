FROM debian:buster

RUN apt update
RUN apt install -y nano redis

COPY tools/configure.sh /var/www/configure.sh

CMD bash /var/www/configure.sh