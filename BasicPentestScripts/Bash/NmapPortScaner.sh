ip=<IP>;ports=$(nmap -T5 -p- $ip -Pn | grep '^[0-9]' | cut -d "/" -f1 | tr '\n' "," | sed s/,$//); echo -e "\n[+] Discovered ports --> $ports\n"; nmap -T5 -A -p$ports $ip -Pn -oA $ip
