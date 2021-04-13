FROM alpine:3.12.3

RUN apk -U upgrade
RUN apk add nginx openssl openssh openrc 
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN mkdir -p /run/nginx
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/telegraf

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN openssl req -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -x509 -days 365 \
    -out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/L=Kazan/O=21school/CN=localhost"

RUN adduser -D newuser
#добавляет пользователя в систему, исходя из параметров, заданных в командной строке и информации из файла /etc/adduser.conf
#-D     Не назначать пароль
RUN echo "newuser:1234" | chpasswd
# chpasswd считывает список пар имени пользователя и пароля из стандартного ввода и использует эту информацию для обновления группы существующих пользователей

RUN ssh-keygen -A 
#флаг -A генерирует ключи хоста(сервера)

EXPOSE 80 443 22

CMD supervisord -c /etc/supervisord.conf
#запуск в режиме процесса, чтобы nginx висел
#docker держит процессы, запускаемые чрз ENTRYPOINT или CMD