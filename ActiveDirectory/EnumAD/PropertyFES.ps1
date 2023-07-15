$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$PDC = $domainObj.PdcRoleOwner.Name
$DN = ([adsi]'').distinguishedName 
$LDAP = "LDAP://$PDC/$DN"

$direntry = New-Object System.DirectoryServices.DirectoryEntry($LDAP)

$dirsearcher = New-Object System.DirectoryServices.DirectorySearcher($direntry)
$dirsearcher.filter="samAccountType=<samAccountTypeNumber>"
$result = $dirsearcher.FindAll()

Foreach($obj in $result)
{
    Foreach($prop in $obj.Properties)
    {
        $prop
    }

    Write-Host "-------------------------------"
}

#This script performs an filtered enumeration like the FilteredEnumerationScript.ps1 but it leverages some loops to expose the propierties of the enumerated object.


#It is highly recomended to not use this script with a object type filtering because the output could be exhausting. Instead, is better to filter a concrete object by a unique property. For example, enumerate the memberof property of the user jeffadmin:


#[...]
#$dirsearcher = New-Object System.DirectoryServices.DirectorySearcher($direntry)
#$dirsearcher.filter="name=jeffadmin"
#$result = $dirsearcher.FindAll()

#Foreach($obj in $result)
#{
#    Foreach($prop in $obj.Properties)
#    {
#        $prop.memberof
#    }
#
#    Write-Host "-------------------------------"
#}

#This also works as an example of the differents properties and objects that can be use to filter desiderable information.
