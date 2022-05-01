FROM node:16.14.2-alpine

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc && \
    apk add --no-cache bash git make python3 curl 

RUN yarn --version &&\
    yarn policies set-version && \
    yarn global add @angular/cli@13.3.4

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4200
WORKDIR /data

HEALTHCHECK --interval=15s --timeout=15s --retries=60 \
    CMD netstat -an | grep 4200 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

CMD ["/entrypoint.sh"]