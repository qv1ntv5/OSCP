# In the same way in the PassTheHash technique we leverage the NTLM hash from a local administrator user to authenticated to a unsecure system. 
# OverPassTheHash technique expands this concept into the Kerberos protocol. It aims to leverage a NTLM hash in order to get a Kerberos TGT.

# This can be achieve after obtain a NTLM hash, using mimikatz in an administrative shell:

sekurlsa::pth /user:<USERNAME> /domain:<DOMAIN> /ntlm:<NTLMhash> /run:powershell 

# This would spawn a powershell as that user but unauthenticated in the domain. Thus, we request a resource in order to get a TGT as that user.

net use \\<hostname>

# This would grant to us a Kerberos TGT as the user owner of the NTLM hash we have just stole and we can access any resource in the domain as that user because we have a TGT autenticated by the domain controller. Id important to not use with the method any IP, only hostname because this would trigger a user validation process that could get us out of the machine.
