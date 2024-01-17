#!/bin/bash
#Ruby & bundler installation script


#install ruby & bundler
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
sudo apt upgrade
# Check version
echo "ruby check verison:"
 ruby -v
echo "bundler check version:"
 bundler -v
