FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
        mariadb-client \
        mariadb-server && \
    rm -rf /var/lib/apt/lists/*


RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


COPY tools/db.sh /usr/local/bin/db.sh

RUN chmod +x /usr/local/bin/db.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/db.sh"]