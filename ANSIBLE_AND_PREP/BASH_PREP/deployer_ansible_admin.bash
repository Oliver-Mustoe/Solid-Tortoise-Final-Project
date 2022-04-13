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

# Install needed prerequisites
sudo su - hatchling -c 'sudo apt install pip sshpass python3-paramiko -y'
wait

# Installs Ansible, (pip3 for python3)
sudo su - hatchling -c 'pip3 install ansible'
wait

# Generate SSH key for ansible as the hatchling user
sudo su - hatchling -c 'ssh-keygen -t rsa'

# Let user know what they now need to do
echo "[Will need to git clone https://Solid-Tortoise/Oliver-Mustoe/Solid-Tortoise for hatchling]"

# Prompts user that system will now reboot
read -p "Your system will now reboot..."
wait
# Reboot system
sudo reboot now
