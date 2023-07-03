ssh2john id_rsa > ssh.hash

----------------------------------------------------------------------

hashcat -h | grep -i "ssh"

hashcat -m 22921 ssh.hash <wordlists> [-r ssh.rule] --force

----------------------------------------------------------------------

#If Hashcat doesn't support the hash algorith we can try with JohnTheRipper.

john --wordlist=<wordlists> --rules=<rulename> <hashfile>

#John the ripper store its rules in /etc/john/john.conf, by the label:

[List.Rules:<rulesname>]
rule1
rule2
...
rulex

#For example;

# [List.Rules:sshRules]
# c $1 $3 $7 $!
# c $1 $3 $7 $@
# c $1 $3 $7 $#

#So you have to pass the contents above into the /etc/john/john.conf and then call the rule by the name of the label, in this case, sshRules.
