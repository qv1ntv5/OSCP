--------------------------------------------
Batch

whoami <--- Domain\username
whoami /groups <--- Groups in which current user belongs.
whoami /priv <--- Privileges over the system owned by current user.
net user <--- Accounts availables on Domain
net user <USERNAME> / whoami /all <--- Describes full USERNAME context
runas /user:<USERNAME> cmd <--- With GUI and credentials we can run a CMD as other user.

--------------------------------------------
PowerShell

Get-LocalGroupMember <GROUPNAME> <--- Displays GROUPNAME members.
