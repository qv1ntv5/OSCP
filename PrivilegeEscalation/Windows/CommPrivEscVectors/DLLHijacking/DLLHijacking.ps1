# The DLLHijacking is a privilege escalation vector which consist in the change of a DLL file (windows shared library) that is included in the flow of execution of a process owned by a administrative account resulting in code execution as a upgraded account.

# In order to detect this kind of attack we must first enumerate the services we can restart (manually or triggering and event like reboot the machine) and locate the asociated binaries.

Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'}


# May be this would be more useful. 

Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'} | Select-String -Pattern "system32*" -NotMatch

# Then transfer this binaries onto a Windows machine where we have GUI acces and administrative user and monitorate the used .dll files by this binary with Procmon.

# A binary/service could be vulnerable to this kind of attack if we manage to introduce a dll used by it in one of the following locations ordered by prority of system search:

#	1. The directory from which the application loaded.
# 	2. The system directory.
# 	3. The 16-bit system directory.
# 	4. The Windows directory.
# 	5. The current directory.
# 	6. The directories that are listed in the PATH environment variable.

# This can be achieved in many ways like a .dll not founded, a .dll that is located in the PATH variable but we have write privileges over the directory where the binary is executed, etc.


# Icacls and whoami /group could be useful commands to use in order to check the permissions and privileges over a directory or file to apply the above.
