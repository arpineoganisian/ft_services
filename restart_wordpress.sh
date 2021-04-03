#!/bin/bash

kubectl delete svc wordpress-svc && kubectl delete deploy wordpress-deploy
eval $(minikube docker-env)
docker build -t wordpress-image srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml