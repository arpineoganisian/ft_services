#!/bin/bash

minikube stop && minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl delete svc nginx-svc && kubectl delete deploy nginx-deploy
eval $(minikube docker-env)
docker build -t nginx-image .
kubectl apply -f ../configmap.yaml
kubectl apply -f nginx.yaml
minikube dashboard
