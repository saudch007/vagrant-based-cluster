#!/bin/bash

# Install Docker
apt-get update
apt-get install -y docker.io
usermod -aG docker vagrant

# Copy and run API container
mkdir -p /home/vagrant/api
cp -r /vagrant/api-app/* /home/vagrant/api/
cd /home/vagrant/api
docker build -t flask-api .
docker run -d -p 5000:5000 --name api flask-api