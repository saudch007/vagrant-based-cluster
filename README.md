# Install these

Vagrant, 
Virtaul Box

(Remove firewalls if any)

# vagrant-based-cluster

A Vagrant-based project that provisions 5 VMs: 1 NGINX load balancer and 3 Flask API servers connected to a shared PostgreSQL DB. NGINX distributes requests in round-robin fashion. Demonstrates load balancing, inter-VM communication, and infrastructure automation using Vagrant and VirtualBox.

# Network Configs and Setup Guide

Edit postgresql.conf (usually in /etc/postgresql/<version>/main/postgresql.conf) and set:
listen_addresses = '\*'

Edit /etc/postgresql/<version>/main/pg_hba.conf and add entry:
host all all 192.168.56.0/24 md5

Restart PostgreSQL:
sudo systemctl restart postgresql

Run : vagrant up

# Double check if everythings working fine

Run: vagrant status

(Everything should be in running state.)

# Test

Edit your LoadBalancer's IP in loader.sh, give it executable permissions and run ./loader.sh

# If it is balancing load correctly it should enlist vm number to which request is routed.
