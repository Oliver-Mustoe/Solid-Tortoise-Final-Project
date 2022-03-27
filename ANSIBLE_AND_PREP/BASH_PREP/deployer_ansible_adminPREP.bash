# Install pre-requisites for ansible
# Version 0.1

# Install needed prerequisites
sudo apt install pip sshpass python3-paramiko -y
wait

# Installs Ansible
sudo pip3 install ansible
wait
# Prompts user that system will now reboot
read -p "Your system will now reboot..."
wait
# Reboot system
sudo reboot now