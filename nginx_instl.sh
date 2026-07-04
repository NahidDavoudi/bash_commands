#!/bin/bash
set -e

echo "Updating package list..."
sudo apt update

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Enabling Nginx to run at boot..."
sudo systemctl enable nginx

echo "Starting Nginx service..."
sudo systemctl start nginx

echo "Opening firewall (if UFW is active)..."
sudo ufw allow 'Nginx Full' || true

echo "Final status:"
sudo systemctl status nginx --no-pager

echo "Local access test:"
curl -I http://localhost
