#!/bin/bash

kubectl delete svc nginx-svc
kubectl delete deploy nginx-deploy
docker build -t nginx-image .
kubectl apply -f ../configmap.yaml
kubectl apply -f nginx.yaml