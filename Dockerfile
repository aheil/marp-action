FROM marpteam/marp-cli:latest

USER root

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && 

RUN apk update && apk upgrade && \
    apk add --no-cache git@edge bash@edge jq@edge

WORKDIR /home/marp/app
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]