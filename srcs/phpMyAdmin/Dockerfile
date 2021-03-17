FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add vim supervisor wget php7 php7-fpm php7-mysqli
#php-mysql php-ftp php-mbstring php7.3-fpm

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz &&\
    mv /phpMyAdmin-5.0.4-all-languages /etc/phpMyAdmin

EXPOSE 5000

# PhpMyAdmin needs its own nginx server. The Load Balancer should be able to redirect
# directly to this service.