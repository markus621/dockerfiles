FROM node:12.22.3-alpine

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3 curl 

RUN npm i -g @angular/cli@10.2.3

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4200
WORKDIR /data

HEALTHCHECK --interval=15s --timeout=15s --retries=60 \
    CMD netstat -an | grep 4200 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

CMD ["/entrypoint.sh"]