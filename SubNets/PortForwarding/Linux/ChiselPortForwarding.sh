#In order to perform a reverse port forwading through chisel, we must first, set a socket proxy with chisel in our local machine:

./chisel server -p <tunnelport> --reverse

#Then, in the target machine, we use the following command to use the HTTP tunel to forward the connections from a <localport> to the <targetip>:<targetport>

./chisel client <localip>:<tunnelport> R:<localport>:<targetip>:<targetport>

#With this, if we connect to 127.0.0.1:<localport> we will be sending an receiving connections from <targetip>:<targetport> through the HTTP tunel.
