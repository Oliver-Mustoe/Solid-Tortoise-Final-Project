# This script creates a namespace and a replication group, place this scripts contents inside the ansible file (BACKUP IN CASE ANSIBLE DOES NOT WORK!!!)
# Version 0.1 (WIP)

# Make "shell_share" shared folder
New-Item 'C:\DFSRoots\shell_share' -ItemType Directory

New-SMBShare -Name shell_share -Path 'C:\DFSRoots\shell_share' ChangeAccess "tortoise\Domain Users"

# Create the namespace "shell_share" (path is namespace path,domain, targetpath is individual share path,local)
New-DFsnRoot -TargetPath "\\MGMT01\shell_share" -Type DomainV2 -Path "C:\DFSRoots\shell_share"

# Create folder in namespace
New-DfsnFolder -Path "\\MGMT01\shell_share\user_info"

# Add folder targets