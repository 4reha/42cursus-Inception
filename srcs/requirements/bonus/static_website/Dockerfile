FROM debian:buster

RUN apt update && apt install -y nano

COPY ./conf/index.html /
COPY ./tools/start.sh /usr/local/bin/

CMD [ "bash", "/usr/local/bin/start.sh" ]
