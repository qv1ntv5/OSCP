# Basic nmap scan of SNMP service:

sudo nmap -T5 <ip> -sU -p161,162,10161,10162

# Nmap UDP scan are unreliable. Often we will need to repeat the scans to ensure the results or maybe perfom a scan for each port.
#
# If SNMP port is open, we can follow this guide to discover valuable information: https://book.hacktricks.xyz/network-services-pentesting/pentesting-snmp
