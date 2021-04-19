#!/bin/bash

minikube start --vm-driver=virtualbox --memory 3000

minikube addons enable metallb
eval $(minikube docker-env)

# если metallb не выдает IP
# docker pull metallb/speaker:v0.8.2
# docker pull metallb/controller:v0.8.2

#METALLB
kubectl apply -f srcs/configmap.yaml

#NGINX
docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

#MYSQL
docker build -t mysql-image srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml

#WORDPRESS
docker build -t wordpress-image srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml

#PHP
docker build -t phpmyadmin-image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

#INFLUXDB
docker build -t influxdb-image srcs/influxdb/
kubectl apply -f srcs/influxdb/influxdb.yaml

#GRAFANA
docker build -t grafana-image srcs/grafana/
kubectl apply -f srcs/grafana/grafana.yaml

#FTPS
docker build -t ftps-image srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml

minikube dashboard