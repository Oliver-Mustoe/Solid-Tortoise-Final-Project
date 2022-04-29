#!/bin/bash
# Script to setup Linux (Ubuntu) host for Ansible SSH deployment
# Version: 1.2 - NEEDS DOUBLE CHECK
# Add hatchling user
sudo adduser hatchling
wait
sudo usermod -aG sudo hatchling

# Create "sys265" file
echo "hatchling     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys265"
sudo cp sys265 /etc/sudoers.d/sys265

# Change to hatchling
sudo su - hatchling
