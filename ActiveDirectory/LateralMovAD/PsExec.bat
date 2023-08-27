::Requirements:

:: - Credentials from a local administrator group user on target machine.
:: - ADMIN$ system file is avaliable on target machine.
:: - 'File and Printing share' is habilitated on target machine.

::This is because PsExec perform the following operation; first writes on C:\Windows directory on target machine, the psexesvc.exe. Then creates and spawns a service on the remote host. And finally run commands as a child process of psexesvc.exe.

.\PsExec64.exe -i  \\<hostname> -u <domain>\<username> -p <password> cmd

:: The PsExec64 utility can be download from Microsoft website.
