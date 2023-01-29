FROM php:8-apache

RUN a2enmod rewrite

ENV ACCEPT_EULA=Y

RUN docker-php-ext-install mysqli pdo pdo_mysql 

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y\
    git \
    curl \
    pkg-config \
    zip \
    unzip \
    libcurl4-openssl-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libxslt-dev \
    gnupg \
    cron 
    
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add \
    && curl https://packages.microsoft.com/config/debian/11/prod.list \
        > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        unixodbc-dev \
        msodbcsql17

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install sqlsrv pdo_sqlsrv \
&& docker-php-ext-enable sqlsrv pdo_sqlsrv 

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug 

COPY /conf.d/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

