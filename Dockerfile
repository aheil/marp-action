FROM marpteam/marp-cli:latest

USER root
RUN apk update && apk upgrade && \
    apk add --no-cache git@edge bash@edge jq@edge

WORKDIR /home/marp/app
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]