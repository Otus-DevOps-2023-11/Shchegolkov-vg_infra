#!/bin/bash
#Mongodb  installation script
apt update
DEBIAN_FRONTEND=noninteractiveo apt install mongodb -y
systemctl start mongodb
systemctl enable mongdb
systemctl status mongodb
