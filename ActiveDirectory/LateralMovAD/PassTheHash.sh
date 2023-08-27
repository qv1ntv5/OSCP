#Requirements:
#
# - Port 445 on the target machine (SMB service) is available.
# - NTLM hash of an Local Administrator user.
# - ADMIN$ and 'File and printing' share habilitated.
#
# we can try to perform a PtH attack with the following command using the Impacket collection utility:


/usr/bin/impacket-wmiexec -hashes :<NTLMhash> <USERNAME>@<IP>

#If the attack doesn't work it may be for one or severals of the follwing reasons:
#
#	- A firewall is blocking the 445/tcp port connection.
#	- The users is not part of the Local Administrator group.
#	- The ADMIN$ share or the File and Printing share are not habilitated.
#
#This kind of attack can be launched with other tools.
