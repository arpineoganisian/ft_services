FROM alpine:3.12.3

RUN apk update && apk upgrade
RUN apk add vim wget -y

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz

RUN mv wordpress/ /var/www/

EXPOSE 5050