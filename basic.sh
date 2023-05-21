#!/usr/bin/bash

# randomstring=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)

apt install zip unzip net-tools -yq
apt update -yq
apt dist-upgrade -yq
# hostnamectl set-hostname spot-instances-$randomstring

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker ubuntu
