#!/bin/bash

echo "Starting deployment..."

echo "Updating server packages..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "Installing Git and Nginx..."
sudo apt install git nginx -y

echo "Starting Nginx service..."
sudo systemctl start nginx

echo "Enabling Nginx to start on boot..."
sudo systemctl enable nginx

echo "Moving to web root directory..."
cd /var/www/html || exit

echo "Removing existing website files..."
sudo rm -rf ./*

echo "Cloning GitHub repository..."
sudo git clone git@github.com:DarlingtonCloud/my-project.git .

echo "Deployment completed successfully!"