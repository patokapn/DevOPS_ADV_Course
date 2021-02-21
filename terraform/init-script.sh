#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common python3-pip -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo pip3 install docker



