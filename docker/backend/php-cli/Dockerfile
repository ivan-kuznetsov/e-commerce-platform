FROM php:7.1-cli

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev libpq-dev wget zip libpng-dev\
&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
&& docker-php-ext-install mcrypt pdo_pgsql pgsql zip pdo_mysql gd

RUN wget https://getcomposer.org/installer -O - -q | php -- --install-dir=/bin --filename=composer --quiet

WORKDIR /var/www

RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m app && chmod 777 /var/www

USER app
