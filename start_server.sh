#!/bin/bash
echo "Starting the Python web server..."
cd /home/ec2-user/app
nohup python3 app.py > output.log 2>&1 &