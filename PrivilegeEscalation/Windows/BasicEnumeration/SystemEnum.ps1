--------------------------------
Batch

systeminfo <--- Displays basic system info. The output can be filtered for efficiency with 'findstr', for example; systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type".

schtasks /query /fo LIST /v <--- Enumerate scheduled tasks.

-----------------------------------
PowerShell

driverquery.exe /v /fo csv | ConvertFrom-CSV | Select-Object ‘Display Name’, ‘Start Mode’, Path <--- Displays drivers on the system.

Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer | Where-Object {$_.DeviceName -like "*VMware*"}
