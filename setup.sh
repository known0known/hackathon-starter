#!/bin/sh

install_docker() {
  if [ "$INSTALL_DOCKER" = "false" ]; then
    return 0  # Exit the function early
  fi
  echo "install_docker"
  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
}

install_k8s() {
  if [ "$INSTALL_K8S" = "false" ]; then
    return 0
  fi
  echo "install_k8s"
  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
  chmod +x ./kind
  sudo mv ./kind /usr/local/bin/kind
}

install_kubectl(){
  if [ "$INSTALL_KUBECTL" = "false" ]; then
    return 0
  fi
  echo "install install_kubectl"

  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
}

install_jenkins(){
  echo "Please wait a few seconds, then you can access jenkins from http://localhost:8090/"
  docker-compose -f docker-compose-jenkins.yaml up -d
}

build_jenkins(){
  echo "build jenkins container"
  docker-compose -f docker-compose-jenkins.yaml build
}

build_jenkins
install_jenkins
