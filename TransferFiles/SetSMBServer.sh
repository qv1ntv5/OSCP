# Set SMBServer to be accessed.

impacket-smbserver [-smb2support] <SMBShareName> <SharedFolder>

# By defaut, this command will open a SMBv1 server that could be considered potentially insecure by some servers. In those cases, '-smb2support' could solve the problem.
