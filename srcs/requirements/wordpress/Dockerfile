FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2-fpm php8.2-mysql mariadb-client wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/^listen.*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/php_ini.sh /usr/bin/local/php_ini.sh

RUN chmod +x /usr/bin/local/php_ini.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/bin/local/php_ini.sh"]