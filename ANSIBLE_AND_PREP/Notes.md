ad01 needs the contents of "OpenSSH_Configer" run manually
---  
DONT RE-RUN ANY COMMANDS IN "OpenSSH_Configer"

If sshd doesnt want to start, remove the folder "C:\ProgramData\ssh" and the ssh itself.

This happens due to a key issue when re-running the install command from what I can tell.
---
Steps to add keys to Windows hosts:
1. Use PS_PREP (use the commands)
2. Use Authorized_keys to authorize any keys from mgmt02