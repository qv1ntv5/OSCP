function LDAPSearch {
    param (
        [string]$LDAPQuery
    )

    $PDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
    $DistinguishedName = ([adsi]'').distinguishedName

    $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$PDC/$DistinguishedName")

    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher($DirectoryEntry, $LDAPQuery)

    return $DirectorySearcher.FindAll()

}

#The function before englobes our script. For be able to use, we must import it:

powershell -ep bypass
Import-Module .\script.ps1

#Then, we'll be able to use this through our command line. Some of the uses for it are:

LDAPSearch -LDAPQuery "(samAccountType=805306368)" #<--- To display users enumeration.

LDAPSearch -LDAPQuery "(objectclass=group)" #<--- To display groups enumeration.

foreach ($group in $(LDAPSearch -LDAPQuery "(objectCategory=group)")) {
>> $group.properties | select {$_.cn}, {$_.member}
>> } #<--- To display groups and filter properties.

$sales = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Sales Department))"
$sales.properties.member #<--- To catch and object and enumerate it properties.

$group = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Development Department*))"
$group.properties.member #<--- To enumerate nested groups. 
