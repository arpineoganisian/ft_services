#!/bin/bash

#curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

brew install minikube
brew install kubectl

minikube start --vm-driver=virtualbox

mv /Users/hwoodwri/.brew/Cellar/minikube /Users/hwoodwri/goinfre/minikube
ln -s /Users/hwoodwri/goinfre/minikube /Users/hwoodwri/.brew/Cellar/minikube

mv /Users/hwoodwri/.minikube /Users/hwoodwri/goinfre/.minikube
ln -s /Users/hwoodwri/goinfre/.minikube /Users/hwoodwri/.minikube

