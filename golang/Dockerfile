FROM golang:1.13-alpine

ENV GO111MODULE=on

RUN apk update && \
    apk add --virtual build-dependencies build-base \
    bash git
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
