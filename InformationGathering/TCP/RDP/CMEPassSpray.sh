#THis command will try to enumerate valids credentials on a <ip>. The username/password fields also admits files. If we are trying to enumerate a machine on a AD set, it would be worth to add the [-d <domain>].

crackmapexec rdp <ip> -u <username/file> -p <password/file> [-d <domain>] --continue-on-success

# This method of enumeration often is unrealiable. Try also in combination with others to discard false negatives/positives.


