FROM php:8.2-fpm-alpine

# Установка зависимостей
RUN apk add --no-cache \
    libzip-dev \
    zip \
    curl \
    libpng-dev \
    libxml2-dev

# Установка PHP расширений
RUN docker-php-ext-install \
    pdo_mysql \
    zip \
    gd \
    xml

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html