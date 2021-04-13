FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add wget libc6-compat supervisor telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.5.2.linux-amd64.tar.gz && \
    rm -rf grafana-7.5.2.linux-amd64.tar.gz && \
    mv grafana-7.5.2 grafana
    
COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf


# COPY grafana.db /grafana/data/grafana.db

EXPOSE 3000

#CMD cd grafana/bin/ && ./grafana-server
CMD supervisord -c /etc/supervisord.conf
# The grafana-server binary needs the working directory to be the root install directory
# where the binary and the public folder are located.


# Package details:

# Installs binary to /usr/sbin/grafana-server
# Installs Init.d script to /etc/init.d/grafana-server
# Creates default file (environment vars) to /etc/default/grafana-server
# Installs configuration file to /etc/grafana/grafana.ini
# Installs systemd service (if systemd is available) name grafana-server.service
# The default configuration sets the log file at /var/log/grafana/grafana.log
# The default configuration specifies a SQLite3 db at /var/lib/grafana/grafana.db
# Installs HTML/JS/CSS and other Grafana files at /usr/share/grafana