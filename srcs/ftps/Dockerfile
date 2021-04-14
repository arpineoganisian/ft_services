FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add supervisor openssl vsftpd
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN openssl req -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -x509 -days 365 \
    -out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/L=Kazan/O=21school/CN=localhost"

RUN echo "root:1234" | chpasswd

EXPOSE 21 10090

CMD supervisord -c /etc/supervisord.conf