FROM golang:1.17.4-alpine3.14

RUN apk update && \
    apk add --no-cache --virtual .build-deps build-base gcc && \
    apk add --no-cache bash curl git make python3 consul-template && \
    apk del .build-deps

COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

WORKDIR /app