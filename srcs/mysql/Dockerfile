FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add vim mysql mysql-client openrc

COPY my.cnf /etc/mysql/

COPY start.sh ./

RUN chmod 755 start.sh

EXPOSE 3306

CMD bash start.sh