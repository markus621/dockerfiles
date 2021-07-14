#!/usr/bin/env sh

composer validate --no-check-all && \
    composer install --optimize-autoloader --prefer-dist --no-interaction && \
    php-fpm