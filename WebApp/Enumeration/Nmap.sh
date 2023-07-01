sudo nmap -p80 -sV <ip> #<--- Detect versions.

sudo nmap -p80 --script <scriptNSEname> <ip> #<--- Use script.

#It may be worth to try also with ports 443, 8080 and others non-default common HTTP ports.
