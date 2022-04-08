#!/bin/bash
# Script to setup Linux (Ubuntu) host for Ansible SSH deployment
# Version: 1.2 - NEEDS DOUBLE CHECK
# Add deployer user
sudo adduser deployer
wait
sudo usermod -aG sudo deployer

# Create "sys265" file
echo "deployer     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys265"
sudo cp sys265 /etc/sudoers.d/sys265

# Install needed prerequisites
sudo su - deployer -c 'sudo apt install pip sshpass python3-paramiko -y'
wait

# Installs Ansible
sudo su - deployer -c 'pip3 install ansible'
wait

# Generate SSH key for ansible as the deployer user
sudo su - deployer -c 'ssh-keygen -t rsa -C "controller"'

# Let user know what they now need to do
echo "[Will need to git clone https://Solid-Tortoise/Oliver-Mustoe/Solid-Tortoise], and run 'Ansible_Install.bash'"

# Prompts user that system will now reboot
read -p "Your system will now reboot..."
wait
# Reboot system
sudo reboot now
