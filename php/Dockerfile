FROM php:7.4.4-fpm

RUN apt-get update;

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    libc-client-dev libkrb5-dev \
    && rm -r /var/lib/apt/lists/*
    
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap
RUN docker-php-ext-install mysqli