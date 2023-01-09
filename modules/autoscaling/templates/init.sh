#!/bin/bash

dnf install -y httpd
systemctl enable httpd
systemctl start httpd

INSTANCE=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
echo "It works! This instance is $INSTANCE" > /var/www/html/index.html