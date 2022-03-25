# Script to setup Linux (Ubuntu) host for Ansible SSH deployment
# Version: 0.1
# Add deployer user
sudo adduser deployer
wait
sudo usermod -aG sudo deployer

# Install needed prerequisites
sudo apt install ansible sshpass python3-paramiko
wait

# Change to deployer user
sudo su - deployer
wait

# Create "sys265" file
echo "deployer     ALL=(ALL)     NOPASSWD: ALL" >> sys265

# Copy sys265 to "/etc/sudoers.d/sys264"
cp sys265 /etc/sudoers.d/sys265

# Generate SSH key for ansible
ssh-keygen -t rsa -C "controller"

# Install needed Windows modules
sudo ansible-galaxy collection install ansible.windows

# Let user know what they now need to do
echo ("Will need to know run the comman 'ssh-copy-id -i ~/.ssh/mykey deployer@ansible1-oliver' to copy your SSH to Linux users")
echo ("For Window's hosts, you will need to refer to 'PS_PREP' ")
