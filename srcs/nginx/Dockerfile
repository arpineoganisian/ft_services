FROM alpine:3.11

RUN apk update && apk upgrade
RUN apk add nginx vim openssl openssh supervisor openrc

RUN mkdir -p /run/nginx
RUN mkdir -p /var/log/supervisor

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/index.html
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY supervisord.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -x509 -days 365 \
    -out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/L=Kazan/O=21school/CN=localhost"

#флаг -A генерирует ключи хоста(сервера)
RUN ssh-keygen -A 

EXPOSE 80 443 

#запуск в режиме процесса, чтобы nginx висел
#docker держит процессы, запускаемые чрз ENTRYPOINT или CMD
CMD supervisord -c /etc/supervisord.conf



#COPY my_first_process my_first_process
#COPY my_second_process my_second_process
#CMD ["/usr/bin/supervisord"]