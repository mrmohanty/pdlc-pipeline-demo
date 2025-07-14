#!/bin/bash
cd /home/ec2-user/app
unzip -o myapp.zip
rm -f myapp.zip
nohup python3 app.py > app.log 2>&1 &
