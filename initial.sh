#!/bin/bash

echo 'Installing Basic Packages...'
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt install -yq python3-pip
sudo DEBIAN_FRONTEND=noninteractive apt install -yq python3-virtualenv
sudo DEBIAN_FRONTEND=noninteractive apt install -yq supervisor
sudo DEBIAN_FRONTEND=noninteractive apt install -yq nginx
sudo pip3 install requests
sudo pip3 install pyautogui
echo 'Basic Packages Installed!'

echo 'Virtual Env Settings...'
sudo chmod +x $PWD/setup/scripts/envsetup.sh
sudo $PWD/setup/scripts/envsetup.sh
echo 'Virtual Env Settings Done!'

echo 'Gunicorn Settings...'
sudo chmod +x $PWD/setup/scripts/gunicorn.sh
sudo $PWD/setup/scripts/gunicorn.sh
echo 'Gunicorn Settings Done!'

echo 'Nginx Settings...'
sudo chmod +x $PWD/setup/scripts/nginx.sh
sudo $PWD/setup/scripts/nginx.sh
echo 'Nginx Settings Done!'

echo 'Restarting Services...'
sudo chmod +x $PWD/setup/scripts/restart.sh
sudo chmod +x $PWD/setup/scripts/update.sh
sudo chmod +x $PWD/setup/scripts/update.py
sudo $PWD/setup/scripts/restart.sh

if [ ! -f $PWD/restart.sh ]
then
    sudo cp -rf $PWD/setup/scripts/restart.sh $PWD
fi

if [ ! -f $PWD/update.sh ]
then
    sudo cp -rf $PWD/setup/scripts/update.sh $PWD
fi

echo 'Services Restarted!'
