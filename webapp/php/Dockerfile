FROM php:7.4.9

WORKDIR /php

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libzip-dev \
        default-mysql-client \
        less \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://getcomposer.org/download/2.0.8/composer.phar -O /usr/local/bin/composer && \
    php -r "if (hash_file('sha256', '/usr/local/bin/composer') ==='2021f0d52b446e0efe3c548cc058ab5671fa38cdbcf814e7911c7e9d71d61538') { echo 'Download File is verified'; } else { echo 'Download is failed'; unlink('/usr/local/bin/composer'); } echo PHP_EOL;" && \
    chmod +x /usr/local/bin/composer && \
    /usr/local/bin/composer self-update

RUN docker-php-ext-configure zip && \
    docker-php-ext-install zip && \
    docker-php-ext-install pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY . /php
