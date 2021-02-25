#!/bin/bash

minikube stop && minikube delete && minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
docker build -t nginx-image .
kubectl apply -f ../configmap.yaml
kubectl apply -f nginx.yaml