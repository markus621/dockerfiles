FROM node:13.7.0-alpine

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3 && \
    npm install -g @angular/cli@11.0.4

EXPOSE 4200
WORKDIR /data