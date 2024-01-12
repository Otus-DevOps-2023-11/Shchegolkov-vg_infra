#!/bin/bash
#Mongodb  installation script


#install mongodb
sudo apt update
sudo apt install mongodb -y
#Start and add to  autostart mongodb
echo "start and add to autostart mongodb"
sudo systemctl start mongodb
sudo systemctl enable mongdb
#Check status mongodb
echo "Check status mongodb"
systemctl status mongodb
