#!/bin/bash

sudo echo "DISPLAY=:0" >> ~/.bashrc
sudo python3 $PWD/setup/scripts/update.py
sudo ./restart.sh
