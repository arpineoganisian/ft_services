#!/bin/bash

kubectl delete svc phpmyadmin-svc && kubectl delete deploy phpmyadmin-deploy
eval $(minikube docker-env)
docker build -t phpmyadmin-image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml