#!/bin/bash

#brew install minikube
#brew reinstall minikube

#brew install kubectl
#brew reinstall kubectl


#-------------------------------#

minikube start --vm-driver=virtualbox

minikube status

#minikube dashboard

minikube addons enable matallb

eval $(minikube docker-env)

docker build -t nginx-image .

kubectl apply -f nginx.yaml

kubectl apply -f ../configmap.yaml

