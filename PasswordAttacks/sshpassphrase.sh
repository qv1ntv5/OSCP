ssh2john id_rsa > ssh.hash

----------------------------------------------------------------------

hashcat -h | grep -i "ssh"

hashcat -m 22921 ssh.hash <wordlists> [-r ssh.rule] --force

----------------------------------------------------------------------

#If Hashcat doesn't support the hash algorith we can try with JohnTheRipper.

john --wordlist=ssh.passwords --rules=sshRules ssh.hash

#John the ripper store its rules in /etc/john/john.conf, by the label:

[List.Rules:sshRules]
c $1 $3 $7 $!
c $1 $3 $7 $@
c $1 $3 $7 $#
