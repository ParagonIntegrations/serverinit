# Install some required packages first
sudo apt update
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Get the Docker signing key for packages
curl -Lsf "https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg" | sudo apt-key add -

# Add the Docker official repos
echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Install Docker
# The aufs package, part of the "recommended" packages, won't install on Buster just yet, because of missing pre-compiled kernel modules.
# We can work around that issue by using "--no-install-recommends"
sudo apt update
sudo apt install -y --no-install-recommends \
    docker.io \
    cgroupfs-mount
    
    
sudo systemctl enable docker
sudo systemctl start docker

## install docker-compose pre-requistes
sudo apt install -y python3-pip libffi-dev python3-dev libssl-dev

# Install Docker Compose
sudo apt install -y docker-compose apparmor-utils

sudo usermod -aG docker ${USER}
