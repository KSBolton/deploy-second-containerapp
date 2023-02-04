#!/bin/bash

sudo yum -y update
sudo yum -y install docker

sudo systemctl start docker
sudo usermod -aG docker ec2-user
newgrp docker

# docker pull 954333580089.dkr.ecr.us-east-1.amazonaws.com/kb-sample-flask-app:v1.0
# see if you can put ecr uri here to automate image pulls and container runs.