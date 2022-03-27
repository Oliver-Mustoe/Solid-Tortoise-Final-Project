# Script to setup Linux (Ubuntu) host for Ansible SSH deployment
# Version: 1.0 - NEEDS DOUBLE CHECK
# Add deployer user
sudo adduser deployer
wait
sudo usermod -aG sudo deployer

# Install needed prerequisites
sudo apt install ansible sshpass python3-paramiko -y
wait

# Create "sys265" file
echo "deployer     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys264"
sudo cp sys265 /etc/sudoers.d/sys265

# Generate SSH key for ansible as the deployer user
sudo su - deployer -c 'ssh-keygen -t rsa -C "controller"'

# Install needed Windows modules
sudo ansible-galaxy collection install ansible.windows

# Let user know what they now need to do
echo "[Will need to know run the command 'ssh-copy-id -i ~/.ssh/mykey deployer@ansible1-oliver' to copy your SSH to Linux users]"
echo "[For Window's hosts, you will need to scp the .pub key into the authorized keys folder (should be created after running PS_PREP scripts)]"
echo "[The scp command for windows is 'scp ~/.ssh/id_rsa.pub <USERNAME>@<IP ADDRESS>:/C:/ProgramData/ssh/administrator_authorized_keys']"

# Change to deployer
sudo su - deployer