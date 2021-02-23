FROM alpine:3.11

RUN apk update && apk upgrade
RUN apk add nginx vim openssl

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/index.html
RUN mkdir -p /run/nginx

RUN openssl req -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -x509 -days 365 \
    -out /etc/ssl/certs/localhost.crt -subj "/C=RU/L=Kazan/O=21school/CN=localhost"

EXPOSE 80 443

ENTRYPOINT nginx -g 'daemon off;'
