#!/bin/bash
# Install pre-requisites for ansible
# Version 1.0 - NEEDS DOUBLE CHECK

# Install needed prerequisites
sudo apt install pip3 sshpass python3-paramiko -y
wait

# Installs Ansible
pip3 install ansible
wait
# Prompts user that system will now reboot
read -p "Your system will now reboot..."
wait
# Reboot system
sudo reboot now