#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install -y java-1.8.0-openjdk
sudo yum install httpd -y