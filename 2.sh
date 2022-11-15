#!/bin/bash
set -euo pipefail

# Update and upgrade the system
apt update -y
apt upgrade -y

#install docker, compose and give user permissions
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update -y
apt-cache policy docker-ce
apt install install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
usermod -aG docker ${USER}
