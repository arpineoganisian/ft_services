FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add supervisor openssl vsftpd
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN openssl req -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -x509 -days 365 \
    -out /etc/ssl/certs/localhost.crt \
	-subj "/C=RU/L=Kazan/O=21school/CN=localhost"

EXPOSE 21

CMD supervisord -c /etc/supervisord.conf


# Package details:
# Installs binary to /usr/sbin/grafana-server
# Installs Init.d script to /etc/init.d/grafana-server
# Creates default file (environment vars) to /etc/default/grafana-server
# Installs configuration file to /etc/grafana/grafana.ini
# Installs systemd service (if systemd is available) name grafana-server.service
# The default configuration sets the log file at /var/log/grafana/grafana.log
# The default configuration specifies a SQLite3 db at /var/lib/grafana/grafana.db
# Installs HTML/JS/CSS and other Grafana files at /usr/share/grafana