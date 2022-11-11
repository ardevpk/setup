#!/bin/bash

sudo DISPLAY=:0 python3 $PWD/setup/scripts/update.py
sudo ./restart.sh
