#/bin/bash
sudo yum update
sudo yum install nginx -y
sudo echo "Hey, Terraform User" > /usr/share/nginx/html/index.html
sudo systemctl start nginx
