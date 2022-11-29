FROM php:7.4.4-fpm

# changing debian repository to arvan mirror for internet connection problems
RUN mv /etc/apt/sources.list /etc/apt/sources.list-bac-1;
COPY ./apt/sources.list  /etc/apt/sources.list



RUN usermod -u 1000 www-data && groupmod -g 1000 www-data


RUN apt-get update && \
    apt-get install -y \
    libc-client-dev \
    libkrb5-dev \
    net-tools \
    libzip-dev \
    zlib1g-dev \
    libpng-dev \
    libxml2-dev 

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap
RUN docker-php-ext-install mysqli gd zip soap 


RUN curl -o ioncube_loaders_lin_x86-64.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && \
    tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local && \
    rm -rf ioncube_loaders_lin_x86-64.tar.gz 

# COPY init.sh /home/init.sh

EXPOSE 9000
