# Creates authorized folder (if doesn't exist) & authorizes any keys in the file for administrators, run before OpenSSH_Configer (VALIDATE BEFORE 1.0)
# Version 0.2

# Create authorized keys file (if it doesn't exist)
if (Test-Path "C:\ProgramData\ssh\administrators_authorized_keys"){
    break
}
else{    
    md C:\ProgramData\ssh\administrators_authorized_keys
}

# Appropriately ACL the keys in the folder
icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"