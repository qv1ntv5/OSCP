#In order to substitute a modificable binary that is running as an active service (for example mysql), we must first mv the binary in order to replace it. Otherwise the overwrite operation will triger an error.

-------------------------------
PowerShell

Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'} <--- List running services.

Get-CimInstance -ClassName win32_service | Select Name, StartMode | Where-Object {$_.Name -like 'mysql'} <--- Check service startmode.
------------------------------
Batch

icacls "<FILEPATH>" <--- Check file/directory permissions.

whoami /priv - /group <--- Check privileges or membership groups.

Start/Restart/Stop-Service.

shutdown /r /t 0 <--- Restart machine to trigger auto-mode services payloads.
------------------------------
Bash

x86_64-w64-mingw32-gcc <CODENAME>.c -o <DESTNAME>.exe <--- Compile C code to a service binary.

------------------------------
PowerUp

powershell -ep bypass
Import-Module .\PowerUp.ps1; . .\PowerUp.ps1 <-- Import correctly powerup module.

Invoke-AllChecks <--- Displays all vulnerabilties founded.

Get-ModifiableServiceFile <--- List bin paths of modifiables services files.
