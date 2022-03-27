# Authorizes key file, run after key has been ssh'd into 
# Version 0.3

# See if key file exists
if (Test-Path "C:\ProgramData\ssh\administrators_authorized_keys"){
    # Appropriately ACL the keys in the folder
    icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
}
else{    
    Write-Output "NO KEY FILE"
}