FROM php:8.3-apache

RUN apt-get update; \
    apt-get install -y wget git default-mysql-client zlib1g-dev ssl-cert

RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
    rm -rf /var/lib/apt/lists/*

RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH

RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
RUN echo 'sendmail_path = /usr/bin/mhsendmail --smtp-addr mailhog:1025' > /usr/local/etc/php/php.ini

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd mbstring zip xdebug mysqli pdo pdo_mysql xml @composer

COPY ./config/page.conf /etc/apache2/sites-available/page.conf

RUN a2dissite 000-default.conf; \
    a2ensite page.conf; \
    a2enmod ssl; \
    a2enmod rewrite;

VOLUME /var/www/html/
VOLUME /root/.ssh

RUN chmod -f 700 /root/.ssh/id_rsa || exit 0

ENTRYPOINT cd /var/www/html; \
    composer update; \
    apache2-foreground

