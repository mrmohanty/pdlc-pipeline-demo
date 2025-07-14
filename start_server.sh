#!/bin/bash
echo "Starting the Python web server..."

cd /home/ec2-user/app || exit 1

# Stop any previously running app
pkill -f app.py || true

# Start app in background
nohup python3 app.py > output.log 2>&1 &
