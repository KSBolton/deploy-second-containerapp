#!/bin/bash

sudo yum -y update
sudo yum -y install docker

sudo systemctl start docker
sudo usermod -aG docker ec2-user