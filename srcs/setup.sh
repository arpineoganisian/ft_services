#!/bin/bash

#brew install minikube
#brew reinstall minikube

#brew install kubectl
#brew reinstall kubectl


#-------------------------------#

# start a cluster
minikube start --vm-driver=virtualbox

# check claster status
minikube status

#minikube dashboard

eval $(minikube docker-env)

minikube addons enable matallb



