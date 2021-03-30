FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add vim supervisor wget php7 php7-fpm php7-mysqli php-mbstring

RUN mkdir -p /run/nginx
RUN mkdir -p /var/log/supervisor

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv /phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin
    
COPY config.inc.php /etc/phpmyadmin

EXPOSE 5000

CMD supervisord -c /etc/supervisord.conf

# PhpMyAdmin needs its own nginx server. The Load Balancer should be able to redirect
# directly to this service.