#!/bin/bash
#Mongodb  installation script
#apt update
#DEBIAN_FRONTEND=noninteractiveo apt install mongod -y
#systemctl start mongod
#systemctl enable mongd
#systemctl status mongod

cd ~
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update --fix-missing
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod
