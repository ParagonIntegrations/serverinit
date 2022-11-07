#!/bin/bash
set -euo pipefail

# Update and upgrade the system
apt update -y
apt upgrade -y

#install docker and docker-compose
apt install apt-transport-https ca-certificates curl software-properties-common -y
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update -y
apt-cache policy docker-ce
apt install docker-ce -y
apt install docker-compose -y
usermod -aG docker nelis