#!/bin/bash

kubectl delete svc nginx-svc && kubectl delete deploy nginx-deploy
eval $(minikube docker-env)
docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml