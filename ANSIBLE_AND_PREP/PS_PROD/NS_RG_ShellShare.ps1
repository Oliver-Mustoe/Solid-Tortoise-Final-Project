# This script creates a namespace and a replication group, place this scripts contents inside the ansible file (BACKUP IN CASE ANSIBLE DOES NOT WORK!!!)
# Version 0.1

# Make share
New-SMBShare -Name shell_share -Path 'C:\DFSRoots\shell_share' -FullAccess "tortoise\Domain Admins" -ReadAccess "tortoise\Domain Users"
# Create the namespace "shell_share" | path is namespace path,domain, targetpath is individual share path,local
New-DFsnRoot -TargetPath "\\mgmt01.tortoise.local\shell_share" -Type DomainV2 -Path "\\tortoise.local\shell_share"

# Create folder in namespace
New-DfsnFolder -Path "\\tortoise.local\shell_share\user_info" -TargetPath "\\mgmt01.tortoise.local\shell_share\user_info"

# Add folder targets (path is namespace path,domain, targetpath is individual share path,local)
New-DfsnFolderTarget -Path "\\tortoise.local\shell_share\user_info" -TargetPath "\\dfs01.tortoise.local\dfs01_user"

# Add folder targets (path is namespace path,domain, targetpath is individual share path,local)
New-DfsnFolderTarget -Path "\\tortoise.local\shell_share\user_info" -TargetPath "\\dfs02.tortoise.local\dfs02_user"

# Create replication group, folder, and add the appropriate members
New-DfsReplicationGroup -GroupName "shell_share_user_sync" | Set-DfsReplicatedFolder -FolderName "user_info" | Add-DfsrMember -ComputerName "mgmt01","dfs01","dfs02" 

# Create bi-directional connections between mgmt01 and dfs01
Add-DfsrConnection -GroupName "shell_share_user_sync" -SourceComputerName "mgmt01" -DestinationComputerName "dfs01" 

# Create bi-directional connections between mgmt01 and dfs01
Add-DfsrConnection -GroupName "shell_share_user_sync" -SourceComputerName "mgmt01" -DestinationComputerName "dfs02"

# Set the membership for dfs01 (folderName is the replication folder)
Set-DfsrMembership -GroupName "shell_share_user_sync" -FolderName "user_info" -ContentPath "\\dfs01.tortoise.local\dfs01_user" -ComputerName "dfs01" -PrimaryMember $True -StagingPathQuotaInMB 16384 -Force

# Set the membership for dfs02 (folderName is the replication folder)
Set-DfsrMembership -GroupName "shell_share_user_sync" -FolderName "user_info" -ContentPath "\\dfs02.tortoise.local\dfs02_user" -ComputerName "dfs02" -StagingPathQuotaInMB 16384 -Force

# Set the membership for mgmt01 (folderName is the replication folder)
Set-DfsrMembership -GroupName "shell_share_user_sync" -FolderName "user_info" -ContentPath "\\mgmt01.tortoise.local\shell_share" -ComputerName "mgmt01" -StagingPathQuotaInMB 16384 -Force