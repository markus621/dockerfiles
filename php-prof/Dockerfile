FROM php:7.4.2-fpm-alpine3.11

USER root

RUN apk add --no-cache --virtual .persistent-deps \
        make git bzip2 zip curl graphviz ttf-freefont freetype \
        rabbitmq-c openssh-client bash supervisor

RUN set -xe \
        && ln -s /usr/lib /usr/local/lib64 \
        && apk add --no-cache --virtual .build-deps \
        autoconf dpkg-dev dpkg file g++ gcc libc-dev musl-dev pcre-dev  pkgconf re2c \
        icu-dev libxml2-dev libressl-dev gettext-dev libmcrypt-dev libpng-dev freetype-dev libjpeg-turbo-dev \
        libxslt-dev bzip2-dev rabbitmq-c-dev libzip-dev libwebp-dev libjpeg-turbo-dev libxpm-dev sqlite-dev \
        curl-dev oniguruma-dev freetds-dev postgresql-dev libedit-dev libsodium-dev argon2-dev tidyhtml-dev


RUN export CFLAGS="-I/usr/src/php" \
            && pecl install -o -f redis-5.1.1 xdebug-2.9.2 mongodb-1.6.1 mcrypt-1.0.3 amqp-1.9.4 xhprof-2.1.3 \
            && docker-php-ext-configure gd --with-webp --with-jpeg --with-xpm --with-freetype \
            && docker-php-ext-install -j$(nproc) \
            gettext xmlreader bcmath bz2 calendar ctype curl dba dom exif fileinfo filter ftp gd \
            intl json mbstring mysqli pcntl pgsql pdo pdo_mysql pdo_pgsql pdo_sqlite \
            posix readline session shmop simplexml soap sockets sodium sysvmsg \
            sysvsem sysvshm tidy tokenizer xml xmlrpc xmlwriter xsl zip

RUN docker-php-ext-enable \
                gettext xmlreader bcmath bz2 calendar ctype curl dba dom exif fileinfo filter ftp gd \
                intl json mbstring mysqli pcntl pgsql pdo pdo_mysql pdo_pgsql pdo_sqlite \
                posix readline session shmop simplexml soap sockets sodium sysvmsg \
                sysvsem sysvshm tidy tokenizer xml xmlrpc xmlwriter xsl zip

RUN git clone https://github.com/longxinH/xhprof.git /tmp/xhprof \
        && mkdir -p /tools/xhprof \
        && cp -r /tmp/xhprof/xhprof_lib /tools/xhprof \
        && cp -r /tmp/xhprof/xhprof_html /tools/xhprof \
        && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
        && mkdir -p /tools/phpinfo \
        && docker-php-source delete && apk del .build-deps && rm -rf /tmp/*

COPY php.ini /usr/local/etc/php/conf.d/setup.ini
COPY phpinfo.php /tools/phpinfo/index.php
COPY demo.php /tools/xhprof/xhprof_html/demo.php
COPY supervisord.conf /etc/

USER www-data

EXPOSE 9000 9001 9002 9003

WORKDIR /var/www

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
