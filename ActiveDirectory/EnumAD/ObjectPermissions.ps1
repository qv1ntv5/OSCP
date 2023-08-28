############################################################
# Important Permissions.

#GenericAll: Full permissions on object
#GenericWrite: Edit certain attributes on the object
#WriteOwner: Change ownership of the object
#WriteDACL: Edit ACE's applied to object
#AllExtendedRights: Change password, reset password, etc.
#ForceChangePassword: Password change for object
#Self (Self-Membership): Add ourselves to for example a group

############################################################

#PowerView

Get-ObjectAcl -Identity <object> | Select ObjectSID,ActiveDirectoryRights,SecurityIdentifier #<--- Retrieve SIDs and ADProperty about the specified object. Then we need to convert the SIDs to discover the object afected and the object owner of the permissions with "Convert-SidToName".

#For example, because we are only interested; Get-ObjectAcl -Identity "Management Department" | ? {$_.ActiveDirectoryRights -eq "GenericAll"} | select SecurityIdentifier,ActiveDirectoryRights.

# Also it could be interesting the following command with POWERVIEW module:

Find-InterestingDomainAcl | Select-Object IdentityReferenceName
