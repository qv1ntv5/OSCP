::Remote port forwarding with plink.exe

plink.exe -ssh -l kali -pw <YOUR PASSWORD HERE> -R 127.0.0.1:9999:<forwardedip>:<forwardedport> <localip>
