FROM golang:1.15.14-alpine3.14

ENV GO111MODULE=on

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3

WORKDIR /app