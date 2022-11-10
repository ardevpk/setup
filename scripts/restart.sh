#!/bin/bash

sudo supervisorctl reload
sudo systemctl reload nginx
sudo service nginx restart