#!/bin/bash

if [[ $(which docker) && $(docker --version) ]]; then
    echo "Docker already installed"
    else
    echo "Docker not found and installing it"

#Install pre-requisites
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

#Add Docker’s official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update the package database with the Docker packages from the newly added repo
sudo apt-get update

#Install Docker CE
sudo apt-get install -y docker-ce

fi

    echo "Docker installed successfully"

#Post Install
sudo groupadd docker
sudo usermod -aG docker "$USER"
sudo systemctl enable docker

if [[ $(which docker-compose) && $(docker-compose --version) ]]; then
    echo "Docker Compose already Installed"
    else
    echo "Docker Compose not there and installing it"

#Install Docker Compose
sudo apt-get install docker-compose
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)"

#Set Permissions
sudo chmod +x /usr/local/bin/docker-compose

fi

    echo "Docker Compose installed successfully"
#Create docker network
#sudo docker network create web

# Add the hostname to /etc/hosts
sudo /bin/sh -c 'echo "127.0.0.1 example.com" >> /etc/hosts'

#Install WordPress using Docker Compose
docker-compose up -d

    echo "WordPress installed successfully; Browse example.com to proceed further"
