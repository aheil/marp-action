FROM marpteam/marp-cli:latest

USER root
RUN apk update && apk upgade && \
    apk add --no-cache git@edge bash@edge

WORKDIR /home/marp/app
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]