#!/bin/bash

apt-get update
apt-get install -y postgresql postgresql-contrib

sudo -u postgres psql <<EOF
CREATE DATABASE apidb;
CREATE USER apiuser WITH PASSWORD 'secret';
GRANT ALL PRIVILEGES ON DATABASE apidb TO apiuser;
EOF
