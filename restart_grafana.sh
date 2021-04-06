#!/bin/bash

kubectl delete svc grafana-svc && kubectl delete deploy grafana-deploy
eval $(minikube docker-env)
docker build -t grafana-image srcs/grafana/
kubectl apply -f srcs/grafana/grafana.yaml