#!/bin/bash
# Script to setup Linux (Ubuntu) host for Ansible SSH deployment
# Version: 1.2 - NEEDS DOUBLE CHECK
# Add deployer user
sudo adduser deployer
wait
sudo usermod -aG sudo deployer

# Create "sys265" file
echo "deployer     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys264"
sudo cp sys265 /etc/sudoers.d/sys265

# Generate SSH key for ansible as the deployer user
sudo su - deployer -c 'ssh-keygen -t rsa -C "controller"'

# Let user know what they now need to do
ehco "[Will need to git clone https://Solid-Tortoise/Oliver-Mustoe/Solid-Tortoise]"
# Change to deployer
sudo su - deployer
