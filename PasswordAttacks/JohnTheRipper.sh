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

#So you have to pass the contents above into the /etc/john/john.conf and then call in the john command the rule by the name of the label, in this case, sshRules.
