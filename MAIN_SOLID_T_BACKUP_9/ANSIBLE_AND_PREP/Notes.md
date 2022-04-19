ad01 needs the contents of "OpenSSH_Configer" run manually, or scp'd over to it

---  
DONT RE-RUN ANY COMMANDS IN "OpenSSH_Configer"

If sshd doesnt want to start, remove the folder "C:\ProgramData\ssh" and the ssh itself.

This happens due to a key issue when re-running the install command from what I can tell.

---
Steps to add keys to Windows hosts:
1. Use OpenSSH_Configer.ps1 on windows host (or its commands, host needs to be named)
2. Append windows host keys to authorized keys on mgmt02 (.ssh/authorized_keys)
3. Copy keys from mgmt02 to the windows host authorized keys (scp ~/.ssh/id_rsa.pub (USERNAME)@(HOST):/C:/ProgramData/ssh/administrators_authorized_keys)
4. Run Authorized_keys.ps1 (or its commands)
(2 & 3 can be done in any order)

---
For any ansible host, you will need to ssh into it before running the playbook to add it to known hosts

---
Known issues:
Failure to create DNS zone because of partitions - the issue is believed to be caused by reloading snapshots or virtualization and has been fixed by completely shutting down virtual machines involved (particularly mgmt02) and turning them back on or restarting the ansible playbook.

If any failure happens while installing the "Add_Domain_Computers" DO NOT RESET DC02, you will have to rejoin the computer to the domain by hand with a different hostname if you do.

---
Make sure to run a "eval $(ssh-agent)" & "ssh-add -t 'PLACEHOLDER, INPUT NUMBER HERE' before running playbook"

---
BEFORE windows workstation install, ssh to host to see if it is using mgmt02 keys or not. Any host that does not require a special password, using the mgmt02 password, they no longer need the password variable in the playbooks.

---
HIGHLY RECOMMENDED TO RUN PLAYBOOKS WITH:  
"--syntaxt-check" TO ENSURE PROPER SYNTAX
"--check" TO DRY RUN THE PLAYBOOK

---
ssh-copy-id -i ~/.ssh/mykey deployer@(HOST)' to copy your SSH to Linux users