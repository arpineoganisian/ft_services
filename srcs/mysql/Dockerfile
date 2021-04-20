FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add mysql mysql-client openrc 
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN mkdir -p /run/mysqld

COPY supervisord.conf /etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY my.cnf /etc/mysql/

COPY wordpress.sql ./
RUN chmod 755 wordpress.sql

COPY start.sh ./
RUN chmod 755 start.sh

#RUN /bin/sh /start.sh

#VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

CMD supervisord -c /etc/supervisord.conf