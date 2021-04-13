FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add supervisor

RUN apk add influxdb telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
#RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
#-X, --repository REPO   Use packages from REPO

RUN mkdir -p /run/influxdb
RUN mkdir -p /etc/telegraf
RUN mkdir -p /var/lib/influxdb

COPY supervisord.conf /etc/supervisord.conf

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY ./init.sh /

#RUN influxd run -config /etc/influxdb.conf
#RUN telegraf & influxd run -config /etc/influxdb.conf

# Generate a configuration file
# o generate a configuration file with specific inputs and outputs,
# you can use the --input-filter and --output-filter flags:
#RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

#RUN telegraf -config /etc/telegraf/telegraf.conf 

# RUN telegraf config > /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD supervisord -c /etc/supervisord.conf
#ENTRYPOINT [ "/bin/sh", "-c", "./init.sh" ]
