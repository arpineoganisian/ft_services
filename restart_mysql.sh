#!/bin/bash

kubectl delete svc mysql-svc && kubectl delete deploy mysql-deploy
kubectl delete pv mysql-pv
eval $(minikube docker-env)
docker build -t mysql-image srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml