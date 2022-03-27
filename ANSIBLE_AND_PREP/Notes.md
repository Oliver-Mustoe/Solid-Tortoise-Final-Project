ad01 needs the contents of "OpenSSH_Configer" run manually
---  
DONT RE-RUN ANY COMMANDS IN "OpenSSH_Configer"

If sshd doesnt want to start, remove the folder "C:\ProgramData\ssh" and the ssh itself.

This happens due to a key issue when re-running the install command from what I can tell.
---
Steps to add keys to Windows hosts:
1. Use PS_PREP (use the commands if cant run the files, openssh then keys)
2. If C:\ProgramData\ssh is empty, rerun OpenSSH script then keys
3. Copy keys from mgmt02 to the host authorized keys (command from PS_PREP)
4. Append host keys to authorized keys