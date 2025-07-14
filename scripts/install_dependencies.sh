#!/bin/bash

# Go to app directory
cd /home/ec2-user/app

# Unzip app contents (overwrite if exists)
unzip -o myapp.zip

# Remove the ZIP after extraction
rm -f myapp.zip

# Start the server in the background
nohup python3 app.py > app.log 2>&1 &
