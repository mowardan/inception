FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/conf.d/file.conf

RUN mkdir -p /etc/ssl/private && \
    openssl req -x509 -nodes \
    -subj "/CN=mowardan.42.fr" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]