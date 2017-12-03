FROM php:7.1-cli

MAINTAINER Scott Smith <scott.smith@gwm-intl.com>

RUN apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev zlib1g-dev libicu-dev libxml2-dev libedit-dev libcurl4-openssl-dev g++ rsync \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql intl mbstring bcmath xml readline json curl zip xml \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get remove -y g++ \
    && apt-get clean

CMD ["php", "-a"]
