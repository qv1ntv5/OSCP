---------------------------------------------------------
Batch

tasklist <--- List running process.


----------------------------------------------------------
PowerShell

Get-Process | Select-Object CommandLine,SessionID,ProcessName | Where-Object {$_.SessionID -eq 2 -And $_.ProcessName -eq "<PROCESSNAME>"} | Sort-Object -Property CommandLine -Descending <--- Displays information about PROCESSNAME

Get-WmiObject Win32_Service | Select-Object Name,StartMode,PathName | Where-Object {$_.StartMode -eq "Auto" -and $_.PathName -NotMatch '"'} <--- List Services

