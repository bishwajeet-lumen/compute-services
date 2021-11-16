#!/bin/sh
sudo apt -y update
sudo apt -y install nginx
sudo ufw allow 'Nginx HTTP'
echo '<h1>Hello Elanco!</h1>' | sudo tee /var/www/html/index.html