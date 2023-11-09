1..1024 | % {echo ((New-Object Net.Sockets.TcpClient).Connect("<IP>", $_)) "TCP port $_ is open"} 2>$null

::Windows Batch port scanner.

::Also there is the built-in command Test-NetConnection.

Test-NetConnection -Port 445 192.168.50.151
