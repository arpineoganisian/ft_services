#!/bin/bash

kubectl delete svc ftps-svc && kubectl delete deploy ftps-deploy
eval $(minikube docker-env)
docker build -t ftps-image srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml