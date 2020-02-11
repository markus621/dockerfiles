FROM node:13.7.0-alpine

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3 && \
    npm install -g @angular/cli@9.0.1
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4200
WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
