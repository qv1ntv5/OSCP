------------------------------------
PowerShell

Get-CimInstance -ClassName win32_service | Select Name,State,PathName <--- List Name,State,Paths of services.

wmic service get name,pathname |  findstr /i /v "C:\Windows\\" | findstr /i /v """ <-- Displays unquoted bin paths from services.

Start/Restart/Stop-Service

icacls "<BINPATH>" <--- Check permissions of icacls.

iwr -uri <URI> -Outfile <PATHFILE>.exe <-- Transfer file




PowerUp'S Invoke-Allchecks cmdlet displays Unquoted Path services.
