FROM alpine:3.12.3

RUN apk -U upgrade
RUN apk add wget nginx supervisor wget \
    php7 php7-fpm php7-mysqli php7-mbstring php7-session php7-ctype \
    php7-opcache php7-iconv php7-json php7-xml
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress /var/www/

COPY wp-config.php /var/www/wordpress

EXPOSE 5050

CMD supervisord -c /etc/supervisord.conf