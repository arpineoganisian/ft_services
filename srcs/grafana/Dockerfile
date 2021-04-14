FROM alpine:3.12.3

RUN apk -U upgrade

RUN apk add wget libc6-compat supervisor 
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.5.2.linux-amd64.tar.gz && \
    rm -rf grafana-7.5.2.linux-amd64.tar.gz && \
    mv grafana-7.5.2 grafana
    
COPY supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY grafana.db /grafana/data/grafana.db

EXPOSE 3000

CMD supervisord -c /etc/supervisord.conf