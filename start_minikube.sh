#!/bin/bash

brew install minikube
brew install kubectl

minikube start --vm-driver=virtualbox

mv /Users/hwoodwri/.brew/Cellar/minikube /Users/hwoodwri/goinfre/minikube 
ln -s /Users/hwoodwri/goinfre/minikube /Users/hwoodwri/.brew/Cellar/minikube

mv /Users/hwoodwri/.minikube /Users/hwoodwri/goinfre/.minikube
ln -s /Users/hwoodwri/goinfre/.minikube /Users/hwoodwri/.minikube




minikube stop && minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl delete svc nginx-svc && kubectl delete deploy nginx-deploy
kubectl delete svc phpmyadmin-svc && kubectl delete deploy phpmyadmin-deploy

eval $(minikube docker-env)

#NGINX
docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml

#PHP
docker build -t nginx-image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml



minikube dashboard