FROM alpine:3.12.3

RUN apk -U upgrade
RUN apk add vim wget nginx supervisor wget \
    php7 php7-fpm php7-mysqli php7-mbstring php7-session \
    php7-opcache php7-iconv php7-json php7-xml

RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

#RUN mkdir -p /var/run/php

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress /var/www/

COPY wp-config.php /var/www/wordpress

EXPOSE 5050

CMD supervisord -c /etc/supervisord.conf