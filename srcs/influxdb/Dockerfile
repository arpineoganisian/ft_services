FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add supervisor
RUN apk add influxdb telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
#--repository REPO   Use packages from REPO

RUN mkdir -p /run/influxdb
RUN mkdir -p /etc/telegraf

# Generate a configuration file
#RUN telegraf config > /etc/telegraf/telegraf.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY supervisord.conf /etc/supervisord.conf
COPY ./init.sh /

EXPOSE 8086

CMD supervisord -c /etc/supervisord.conf