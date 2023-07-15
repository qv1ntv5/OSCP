$PDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
$DN = ([adsi]'').distinguishedName 
$LDAP = "LDAP://$PDC/$DN"

$direntry = New-Object System.DirectoryServices.DirectoryEntry($LDAP)

$dirsearcher = New-Object System.DirectoryServices.DirectorySearcher($direntry)
$dirsearcher.filter="samAccountType=<samAccountTypeNumber>"
$dirsearcher.FindAll()

#This script is pretty the same that the EnumerationScript.ps1 with the difference that here we have added a .filter property to the dirsearcher var in order to filter by object type.

#This can be achieved by using the 'samAccountType' number that every object type have assigend in AD. Thus, for example, users can be filtered with the number 0x30000000 (decimal 805306368). 

#There are another statements that could be used to filter, for example, instead of the samAccountType number, we can simple put a pattern that matchs our interests; "name=jeffadmin". This makes our script extremely flexible. 
