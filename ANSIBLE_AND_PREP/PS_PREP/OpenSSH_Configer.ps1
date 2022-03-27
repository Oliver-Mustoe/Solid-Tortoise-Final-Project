# Setup commands needed for Ansible on Windows (DON'T RUN TWICE)
# Execution policy needs to be set (Set-ExecutionPolicy unrestricted)
# Version: 1.1 - NEEDS DOUBLE CHECK
#Requires -RunAsAdministrator
# Install OpenSSH , does not install if "ssh" folder exists
if (Test-Path C:\ProgramData\ssh) {
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
}
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

# Change SSH shell to powershell
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds" -Name ConsolePrompting -Value $true
New-ItemProperty -Path HKLM:\SOFTWARE\OpenSSH -Name Defaultshell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force