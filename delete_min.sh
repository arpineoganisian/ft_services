#!/bin/bash

echo -e "\033[37;1;41m MAKING DIRECTORIES \033[0m"
mkdir -p ~/goinfre/brew/
mkdir -p ~/goinfre/docker
#mkdir -p ~/goinfre/minikube
echo -e "\033[37;1;41m BREW INSTALLING \033[0m"
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
echo -e "\033[37;1;41m BREW MOVE TO GOINFRE \033[0m"
mv .brew ./goinfre/brew/
ln -s ./goinfre/brew/.brew .brew
echo -e "\033[37;1;41m MINIKUBE INSTALLING \033[0m"
brew remove minikube
rm -rf .minikube
rm -rf .kube
brew install minikube