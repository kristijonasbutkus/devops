FROM php:7.2.2-fpm-alpine3.7

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chmod +x /usr/local/bin/composer

RUN docker-php-ext-install pdo_mysql

WORKDIR /src

EXPOSE 80

RUN set -x ; \
  addgroup -g 1001 -S container ; \
  adduser -u 1001 -D -S -G container container && exit 0 ; exit 1

USER container
