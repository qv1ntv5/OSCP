#File GoBuster enumeration.

ip=<IP>;gobuster dir -u http://$ip -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x <EXT1>,<EXT2>,... -t 50 -o file.$ip #<--- GoBuster dir enumeration. Add a -k to enumerate a SSL URI (https).

#WebDir GoBuster enumeration.

ip=10.10.10.56;gobuster dir -u http://$ip -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50 -x / -o dir.$ip


ip=<IP>;gobuster vhost -u http://$ip -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --append-domain -o vhost.$ip #<--- GoBuster subdomain enumeration. Add a -k to enumerate a SSL URI (https).

gobuster dir -u http://<ip> -w /usr/share/wordlists/dirb/big.txt -p pattern #<--- API bruteforce discovery. The pattern file must have the following form:

#{GOBUSTER}/v1
#{GOBUSTER}/v2

# Where {GOBUSTER} is the term in the pattern that will be bruteforced.
