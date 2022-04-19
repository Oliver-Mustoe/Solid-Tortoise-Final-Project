#!/bin/bash
# Script to setup Linux (CentOS 7) hosts for Ansible SSH
# Version: 0.5
# Add hatchling user
sudo useradd -mk /etc/skel -s /bin/bash -d /home/hatchling -G wheel hatchling

echo "SET THE SAME PASSWORD AS ON THE ADMIN NODE"
# Set a password for "hatchling" (will require a prompt, MUST BE SAME ACROSS ALL SYSTEMS)
sudo passwd hatchling
wait

# Create "sys265" file
echo "hatchling     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys264"
sudo cp sys265 /etc/sudoers.d/sys265

# Change to hatchling
sudo su - hatchling