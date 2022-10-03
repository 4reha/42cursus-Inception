FROM debian:buster

RUN apt update && apt install -y nano

RUN mkdir /backup

COPY ./tools/backup.sh /usr/local/bin/backup.sh
RUN chmod +x /usr/local/bin/backup.sh

CMD [ "/usr/local/bin/backup.sh" ]