FROM php:7.2.2-fpm-alpine3.7

RUN apk --no-cache add bash

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chmod +x /usr/local/bin/composer

RUN mkdir /src

RUN docker-php-ext-install pdo_mysql

WORKDIR /src

EXPOSE 80

RUN set -x ; \
  addgroup -g 1000 -S php-container ; \
  adduser -u 1000 -D -S -G php-container php-container && exit 0 ; exit 1

USER php-container
