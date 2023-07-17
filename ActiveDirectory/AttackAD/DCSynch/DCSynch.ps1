# If we have:
# - Replicating Directory Changes
# - Replicating Directory Changes All
# - Replicating Directory Changes in Filtered Set
#
# Or we are part of Domain Admins, Enterprise Admins or Administrator groups we can perform a Domain Controller impersonation.
#
# In a compromise Windows hosts we can upload mimikatz and in a mimikatz session we type the following commands:

lsadump::dcsync /user:<domain>/<username>

# This will dump the credentials of the user specified.


