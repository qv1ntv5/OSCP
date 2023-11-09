nmap -v -p 139,445 -oG smb.txt 192.168.50.1-254 #<--- Net SMB ports scan.
nmap --script smb* <ip> -p139,445 -T5 #<--- Script SMB scan.

#All scripts can be found in: ls -1 /usr/share/nmap/scripts/smb*
