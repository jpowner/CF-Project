#!/bin/bash
dnf install -y httpd
systemctl enable httpd
systemctl start httpd