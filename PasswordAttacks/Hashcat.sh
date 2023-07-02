
/usr/share/hashcat/rules/ # <--- Hashcat rules.

hashcat -h | grep -i "<Algorithm>"

#For example; hashcat --help | grep -i "KeePass" o Kerberos


hashcat -m <CrackNumber> <hashfile> <wordlists> -r <rulesfile> --force #Use hashcat witha set of rules on the file <rulesfile>
