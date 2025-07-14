#!/bin/bash

cd /home/ec2-user/app

unzip -o myapp.zip || exit 1
rm -f myapp.zip

# Start app in background
nohup python3 app.py > app.log 2>&1 &
