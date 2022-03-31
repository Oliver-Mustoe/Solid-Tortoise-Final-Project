ad01 needs the contents of "OpenSSH_Configer" run manually, or scp'd over to it
---  
DONT RE-RUN ANY COMMANDS IN "OpenSSH_Configer"

If sshd doesnt want to start, remove the folder "C:\ProgramData\ssh" and the ssh itself.

This happens due to a key issue when re-running the install command from what I can tell.
---
Steps to add keys to Windows hosts:
1. Use OpenSSH_Configer.ps1 on windows host (or its commands)
2. Copy keys from mgmt02 to the windows host authorized keys (command from deplyer_ansible_admin.bash)
3. Append windows host keys to authorized keys on mgmt02
4. Run Authorized_keys.ps1 (or its commands)
5. Use ansible win_ping to make sure everything is running as it should be
---
For any ansible host, you will need to ssh into it before running the playbook to add it to known hosts