#############################################################

#From a Batch cmd session on the same directory in which is stored PowerView:

Powershell -ep bypass

Import-Module .\PowerView.ps1

. .\PowerView.ps1

#When using a network logon such as WinRM or a bind shell, Get-CimInstance and Get-Service will result in a "permission denied" error when querying for services with a non-administrative user. Using an interactive logon such as RDP solves this problem. THIS ALSO APPLIES OVER SOME CMDLETS OF POWERVIEW AND POWERUP THAT MAY NOT WORK UNTIL WE HAVE AN ADMINISTRATOR OR A GUI SESSION.

###############################################################

# Once we have imported correctly PowerView, we have access to the following new cmdlets:

Get-NetDomain # <--- Retrieve basic information about the domain.
Get-NetUser # <--- Retrieve basic user information. Some variants includes: Get-NetUser | Select cn to only retrieve the names (Get-NetUser | select cn,pwdlastset,lastlogon); Get-NetUser <username> to retrieve information about one single user.
Get-NetComputer # <--- to enumerate the computer objects in the domain.
Find-LocalAdminAccess # <--- Find if our current user has administrative privileges in some machine on the domain.
Get-NetSession -ComputerName <hostname> -Verbose# <--- Logged-in users on a machine (cookie steal). Verbose statement ins necesary for display possible errors.
Get-Acl -Path <object> | fl # <- For example; Get-Acl -Path HKLM:SYSTEM\CurrentControlSet\Services\LanmanServer\DefaultSecurity\ | fl; This will retrieve the permissions seted over the specified object and print it on the screen.

Get-NetUser -SPN | select samaccountname,serviceprincipalname # <--- This will enumerate all the accounts on the domain displaying only the SAN and the SPN if exists.

Get-ObjectAcl -Identity <object> | Select ObjectSID,ActiveDirectoryRights,SecurityIdentifier #<--- Retrieve SIDs and ADProperty about the specified object. Then we need to convert the SIDs to discover the object afected and the object owner of the permissions with "Convert-SidToName".

#For example, because we are only interested; Get-ObjectAcl -Identity "Management Department" | ? {$_.ActiveDirectoryRights -eq "GenericAll"} | select SecurityIdentifier,ActiveDirectoryRights.

Find-DomainShare #<--- Enumerate active shares on domain.

#################################################################
# Complex Scripts.

foreach ($user in $(Get-NetUser | Select-Object -ExpandProperty Name)){echo "[+] $user"; $groups=$(Get-NetUser $user |Select-Object -ExpandProperty memberof -erroraction 'silentlycontinue');echo "[+] $Groups"; echo " "} #<--- Enumerate users and user's membresy. 'ExpandProperty' is used in order to access only to the value instead of the structure name:value in order to operate with it later.
