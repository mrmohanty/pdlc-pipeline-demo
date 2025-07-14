#!/bin/bash

cd /home/ec2-user/app || exit 1

# Stop any running instance of the app
pkill -f app.py

# Start the app in the background
nohup python3 app.py > app.log 2>&1 &
