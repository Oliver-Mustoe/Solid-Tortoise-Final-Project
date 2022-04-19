# Authorizes key file, run after all keys are in place!!!
# Version 1.0 - NEEDS DOUBLE CHECK

# See if key file exists
if (Test-Path "C:\ProgramData\ssh\administrators_authorized_keys"){
    # Appropriately ACL the keys in the folder
    icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
    icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /remove "NT AUTHORITY\Authenticated Users"
    # Restart Services
    Restart-Service -Name sshd -Force
}
else{    
    Write-Output "NO KEY FILE"
}

