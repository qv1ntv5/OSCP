nmap -T5 -p- $ip -Pn | grep '^[0-9]' | cut -d "/" -f1 | tr '\n' "," | sed s/,$//
