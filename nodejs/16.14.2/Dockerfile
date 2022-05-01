FROM node:16.14.2-alpine

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3 curl &&\
    yarn policies set-version

COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

WORKDIR /data
