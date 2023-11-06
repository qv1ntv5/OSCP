# Basic nmap scan of SNMP service:
 
sudo nmap -n -Pn -sU -p69 -sV --script tftp-enum <ip>

# If TFTP port is open, we can follow this guide: https://book.hacktricks.xyz/network-services-pentesting/69-udp-tftp
