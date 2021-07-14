FROM php:7.4.4-fpm-alpine3.11

USER root

ENV PHPIZE_DEPS \
    autoconf dpkg-dev dpkg file g++ gcc \
    libc-dev musl-dev pcre-dev make pkgconf re2c \
    icu-dev libxml2-dev libressl-dev gettext-dev \
    libmcrypt-dev libpng-dev freetype-dev libjpeg-turbo-dev \
    gmp-dev libxslt-dev bzip2-dev libzip-dev

RUN apk add --no-cache --virtual .persistent-deps \
    icu-libs libstdc++ libgcc libcurl gmp libxslt bzip2 \
    libbz2 libpng libjpeg libintl libmcrypt freetype zip

RUN set -xe \
    && ln -s /usr/lib /usr/local/lib64 \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    &&  pecl install -o -f    igbinary zip mcrypt redis \
    &&  docker-php-ext-enable igbinary zip mcrypt redis \
    &&  docker-php-ext-install -j$(nproc) \
    gd intl pcntl gettext bcmath soap pdo_mysql calendar \
    exif gmp sockets dba bz2 xmlrpc xsl sysvsem mysqli \
    &&  rm -rf /tmp/*

COPY php.ini /usr/local/etc/php/conf.d/setup.ini
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && chmod +x /usr/local/bin/composer

USER www-data

WORKDIR /var/www/html

HEALTHCHECK --interval=15s --timeout=15s --retries=60 \
    CMD netstat -an | grep 9000 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

CMD ["/entrypoint.sh"]