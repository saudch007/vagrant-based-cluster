#!/bin/bash

apt-get update
apt-get install -y nginx

cat <<EOF > /etc/nginx/sites-available/default
upstream apis {
    server 192.168.56.11:5000;
    server 192.168.56.12:5000;
    server 192.168.56.13:5000;
}

server {
    listen 80;
    location / {
        proxy_pass http://apis;
    }
}
EOF

systemctl restart nginx
