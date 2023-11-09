
/usr/share/hashcat/rules/ # <--- Hashcat rules.

hashcat -h | grep -i "<Algorithm>"

#For example; hashcat --help | grep -i "KeePass" o Kerberos
#hashcat --help | grep -i "ntlm"

hashcat -m <CrackNumber> <hashfile> <wordlist> [-r <rulesfile>] --force #Use hashcat with a set of rules on the file <rulesfile>


