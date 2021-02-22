#!/bin/bash

minikube stop
minikube delete
rm -rf ~/.kube ~/.minikube
rm -rf /usr/local/bin/localkube /usr/local/bin/minikube
launchctl stop '*kubelet*.mount'
launchctl stop localkube.service
rm -rf /etc/kubernetes/