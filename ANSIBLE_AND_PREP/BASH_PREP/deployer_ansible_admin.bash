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
echo "[Will need to know run the command 'ssh-copy-id -i ~/.ssh/mykey deployer@<HOST>' to copy your SSH to Linux users]"
echo "[The scp command for mgmt02 to windows is 'scp ~/.ssh/id_rsa.pub <USERNAME>@<HOST>:/C:/ProgramData/ssh/administrators_authorized_keys']"
echo "[Run 'Authorized_keys.ps1' on the windows host]"
echo "[scp the windows users public key (located in .ssh) back to mgmt02 and append it to the authorized_keys file in .ssh (create if it does not exist)]"
# Change to deployer
sudo su - deployer
