FROM golang:1.19.4-alpine

RUN apk update && \
    apk add --no-cache --virtual .build-deps build-base && \
    apk add --no-cache bash curl git make python3 consul-template gcc g++ && \
    apk del .build-deps

COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

WORKDIR /app