# Creates authorized folder (if doesn't exist) & authorizes any keys in the file for administrators
# Version 0.1

# Create authorized keys file (if it doesn't exist)
if (Test-Path C:\ProgramData\ssh\administrators_authorized_keys){
    mkdir C:\ProgramData\ssh\administrators_authorized_keys
}

# Appropriately ACL the keys in the folder
icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"