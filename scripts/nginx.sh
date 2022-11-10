#!/bin/bash

if [ -f '/etc/nginx/sites-available/django.conf' ]
then
    sudo rm -rf /etc/nginx/sites-available/django.conf
fi

if [ -f '/etc/nginx/sites-enabled/django.conf' ]
then
    sudo rm -rf /etc/nginx/sites-enabled/django.conf
fi

sudo cp -rf $PWD/setup/scripts/django.conf /etc/nginx/sites-available/
sudo nginx -t
sudo ln /etc/nginx/sites-available/django.conf /etc/nginx/sites-enabled
