FROM php:5.6-apache

LABEL maintainer=olblak

RUN \
  apt-get update && \
  apt-get install -y git apache2 postgresql postgresql-client && \
  apt-get install -y php-soap && \
  apt-get install -y libcurl4-openssl-dev libxml2-dev && \
  apt-get clean

RUN \
  apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpq-dev \
    libpng12-dev  && \
  apt-get clean && \
  docker-php-ext-install -j 1 curl iconv mcrypt iconv soap pgsql pcntl

RUN git clone https://tt-rss.org/git/tt-rss.git /var/www/html

COPY config/config.php /var/www/html/config.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
