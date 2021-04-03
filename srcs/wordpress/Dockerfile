FROM alpine:3.12.3

RUN apk update && apk upgrade
RUN apk add vim wget nginx supervisor

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress/ /etc/

COPY wp-config.php /etc/wordpress/

RUN chown -R 

EXPOSE 5050

CMD supervisord -c /etc/supervisord.conf