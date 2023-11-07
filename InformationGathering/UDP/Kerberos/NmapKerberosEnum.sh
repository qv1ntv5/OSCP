sudo nmap -p 88 --script=krb5-enum-users --script-args krb5-enum-users.realm="EGOTISTICAL-BANK.LOCAL0.",userdb="/usr/share/commix/src/txt/usernames.txt" <ip> -sU

