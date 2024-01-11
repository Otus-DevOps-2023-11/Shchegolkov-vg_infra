#!/bin/bash
#App installation script


#Go to project folder
sudo cd /home/yc-user
echo
pwd
#Download and install git
sudo apt install git -y
#Clone REPO
sudo git clone -b monolith https://github.com/express42/reddit.git
#installing application dependency
cd reddit
bundle install
#start app
puma -d
"Chec launch app
ps aux | grep puma
