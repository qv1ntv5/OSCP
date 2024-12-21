ip=<IP>;ports=$(nmap -T5 -p- $ip -Pn | grep '^[0-9]' | cut -d "/" -f1 | tr '\n' "," | sed s/,$//); echo -e "\n[+] Discovered ports --> $ports\n"; nmap -T5 -A -p$ports $ip -Pn -oN $ip

// This line performs a portscan in two separates steps:
// First, perform a smooth scan overall ports in a given IP.
// Then, it performs a deep scan in the discovered ports and write the output to a simple text file with the name of the IP provided.