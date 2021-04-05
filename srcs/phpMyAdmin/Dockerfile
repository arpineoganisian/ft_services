FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add vim nginx openrc supervisor wget php7 php7-fpm php7-mysqli php7-mbstring php7-session \
    php7-opcache php7-iconv php7-json php7-xml

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin

RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY config.inc.php /etc/phpmyadmin

RUN chmod -R 755 /etc/phpmyadmin
RUN mkdir -p /etc/phpmyadmin/tmp/ && chmod 777 /etc/phpmyadmin/tmp/

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5000

CMD supervisord -c /etc/supervisord.conf