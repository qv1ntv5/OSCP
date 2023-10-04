###########################################################################
#Presentation.
# The DLLHijacking is a privilege escalation vector which consist in the change of a DLL file (windows shared library) that is included in the flow of execution of a process owned by a administrative account resulting in code execution as a upgraded account.

# In order to detect this kind of attack we must first enumerate the services we can restart (manually or triggering and event like reboot the machine) and locate the asociated binaries.

Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'}


# May be this would be more useful. 

Get-CimInstance -ClassName win32_service | Select Name,State,PathName | Where-Object {$_.State -like 'Running'} | Select-String -Pattern "system32*" -NotMatch

# Then transfer this binaries onto a Windows machine where we have GUI acces and administrative user and monitorate the used .dll files by this binary with Procmon.

#########################################################################
#Procmon

#If the binary only can be started as a service. In an administrator CMD session:

sc.exe create <servicename> binPath= "<pathtothebinary>"

#Then we add a filter in Procmon.exe

Filter --> ProcessName | is | <binaryname>.exe | Include ---> Add ---> Apply #Exclude any other binary thread.


#Then we restart/start the service with PowerShell cmdlets: Start/Restart-Service.

#Then in Procmon we add a fitler for only search for dlls.

Filter --> Operation |is | IRP_MJ_CREATE (or CreateFile) | Include ---> Add ---> Apply # 

#IRP_MJ_CREATE, detect when a file is tried to get created or opened, detec .dll files asociated with the binary.

# A binary/service could be vulnerable to this kind of attack if we manage to introduce a dll used by it in one of the following locations ordered by prority of system search:

#	1. The directory from which the application loaded.
# 	2. The system directory.
# 	3. The 16-bit system directory.
# 	4. The Windows directory.
# 	5. The current directory.
# 	6. The directories that are listed in the PATH environment variable.

# This can be achieved in many ways like a .dll not founded, a .dll that is located in the PATH variable but we have write privileges over the directory where the binary is executed, etc.


# Icacls and whoami /group could be useful commands to use in order to check the permissions and privileges over a directory or file to apply the above.

############################################################################
#Leading the attack.

#Once we detected a potential vulnerable point we must select the code to introduce on the flow of the binary through the DLL.

#Once we have it, we use the following command in order to create a DLL library:


x86_64-w64-mingw32-gcc <filecode>.cpp --shared -o <filename>.dll #It is recommended to install it first if it appears errors using the command: sudo apt-get install mingw-w64. If there is any problem with the installation: sudo apt-get update; sudo apt-get install --reinstall build-essential.

#Then we transfer the dll onto the machine and subsitutue or place it in the correct place and restart the service getting our command executed.

