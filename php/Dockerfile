FROM php:7.4.4-fpm

# changing debian repository to arvan mirror for internet connection problems
RUN mv /etc/apt/sources.list /etc/apt/sources.list-bac-1;
COPY ./apt/sources.list  /etc/apt/sources.list



RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    libc-client-dev libkrb5-dev \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap
RUN docker-php-ext-install mysqli

RUN apt-get update && \
    apt install net-tools;

RUN curl -o ioncube_loaders_lin_x86-64.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && \
    tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local && \
    rm -rf ioncube_loaders_lin_x86-64.tar.gz 


EXPOSE 9000