#!/bin/bash

kubectl delete svc influxdb-svc && kubectl delete deploy influxdb-deploy 
eval $(minikube docker-env)
docker build -t influxdb-image srcs/influxdb/
kubectl apply -f srcs/influxdb/influxdb.yaml