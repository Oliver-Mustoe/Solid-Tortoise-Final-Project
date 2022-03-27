# Authorizes key file, run after all keys are in place!!!
# Version 0.3

# See if key file exists
if (Test-Path "C:\ProgramData\ssh\administrators_authorized_keys"){
    # Appropriately ACL the keys in the folder
    icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
    # Restart Services
    Restart-Service -Name sshd, ssh-agent -Force
}
else{    
    Write-Output "NO KEY FILE"
}

