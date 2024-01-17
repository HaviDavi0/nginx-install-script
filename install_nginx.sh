#!/bin/bash

# Declare Variables:
SSH_key="/path/to/your/private/key"
SERVER_IP="your_server_ip"
SERVER_USER="your_username"

echo "Attempting to SSH onto server"
if ssh -i $SSH_key $SERVER_USER@$SERVER_IP true; then
    # Start to check if NGINX is installed#############################################
    echo "NGINX status check"
    if ! ssh -i $SSH_key $SERVER_USER@$SERVER_IP command -v nginx &> /dev/null; then
        # Install nginx
        echo "NGINX not present\nInstalling NGINX now..."
        ssh -i $SSH_key $SERVER_USER@$SERVER_IP "sudo apt-get update && sudo apt-get install -y nginx"
    else
        echo "NGINX is already installed."
    fi

    # Verify NGINX is running
    echo "NGINX confirmation"
    if ssh -i $SSH_key $SERVER_USER@$SERVER_IP sudo systemctl is-active --quiet nginx; then
    echo "NGINX is running, nice!"
    else
        # After NGINX is installed, start NGINX if not running
        echo "Starting NGINX"
        ssh -i $SSH_key $SERVER_USER@$SERVER_IP "sudo systemctl start nginx"
    fi
fi