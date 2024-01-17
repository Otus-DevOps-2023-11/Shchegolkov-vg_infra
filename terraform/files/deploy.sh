#!/bin/bash
sleep 40
APP_DIR=${1:-$HOME}
mkdir $APP_DIR/reddit
sleep 40
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git
sleep 40
sudo git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit/
cd $APP_DIR/reddit/
sudo bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
