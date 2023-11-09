#THis command will try to enumerate valids credentials on a <ip>. The username/password fields also admits files. If we are trying to enumerate a machine on a AD set, it would be worth to add the [-d <domain>].

crackmapexec winrm <ip> -u <username/file> [-p <password/file> | -H <hash>]  [-d <domain>] --continue-on-success


