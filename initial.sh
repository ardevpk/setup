#!/bin/bash

echo 'Installing Basic Packages...'
sudo apt-get update
sudo apt-get install python3-pip -y
sudo apt-get install python3-virtualenv -y
sudo apt-get install supervisor -y
sudo apt-get install nginx -y
sudo pip3 install requests
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
sudo $PWD/setup/scripts/restart.sh

if [ ! -f `$PWD/restart.sh` ]
then
    sudo cp -rf $PWD/setup/scripts/restart.sh $PWD
fi

echo 'Services Restarted!'
