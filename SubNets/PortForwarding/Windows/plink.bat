::Remote port forwarding with plink.exe

plink.exe -ssh -l kali -pw <YOUR PASSWORD HERE> -R 127.0.0.1:<localport>:<forwardedip>:<forwardedport> <localip>

::This command will connect to our machine through SSH (so we have to start the SSH service) and will open the <localport> port to redirect any connections to forwardedip:forwardedport. For example, if we are going to redirect connections to a webserver is worth to open the localport 80.
