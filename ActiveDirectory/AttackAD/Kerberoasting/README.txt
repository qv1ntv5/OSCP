Kerberoasting is a AD Attack Technique which relays in Kerberos authentication protocol. More precisely, in the part when a user request a resource to a SPN (Service Principal Name, a running instance from a service like iis_service).

When the request is perform a Service Ticket encrypted with the hash from the password of the SPN is granted. If we manage to decrypt it, we would get access to the clear password text of the SPN. 

Both tools, Ruberus and 'impacket-GetUserSPNs' detect by itselfs the vulnerable services and extract the hashes.
