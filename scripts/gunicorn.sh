#!/bin/bash

if [ -f '/etc/supervisor/conf.d/gunicorn.conf' ]
then
    sudo rm -rf /etc/supervisor/conf.d/gunicorn.conf
fi

sudo cp -rf $PWD/setup/scripts/gunicorn.conf /etc/supervisor/conf.d/

if [ ! -d '/logs' ]
then
    sudo mkdir /logs
fi

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status
