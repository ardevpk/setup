#!/bin/bash

if [ ! -d $PWD/env ]
then
    virtualenv $PWD/env
fi

source $PWD/env/bin/activate
cd $PWD/project
pip install -r $PWD/requirements.txt
python $PWD/manage.py migrate
python $PWD/manage.py collectstatic --no-input
