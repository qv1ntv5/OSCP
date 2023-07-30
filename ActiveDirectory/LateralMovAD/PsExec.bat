::If we have identified the credentials (username/password) from a local administrator group user and ADMIN$ system file is avaliable and option 'File and Printing share' are habilitated then we can use the PsExec.exe utility from SysinternalsSuite.

.\PsExec64.exe -i  \\<hostname> -u <domain>\<username> -p <password> cmd

:: The PsExec64 utility can be download from Microsoft website.
