#!/bin/bash

#Usage: ./NetcatScanner <IP> <ThreadNumber> <Ports>; ./NetcatScanner 10.10.10.10 10 10000. !!!It is worth to mention that <Ports>/<ThreadNumber> must be an integer, otherwise the script triggers an error.!!!

#This script attemps to use netcat tool in order to perform a multi-process netcat port scanner. First, we create several bash scripts which scan disjoint port ranges. Then we execute every script at the background to achieve simultaneos execution.

mkdir /tmp/PortScan
mkdir /tmp/OutScan
cd /tmp/PortScan

PortRange=$(($3 / $2))

GenPortScanner="for port in \$(seq 1 $PortRange);do nc -zv -w 1 $1 \$((\$port+YY*$PortRange)) &>> /tmp/OutScan/ncOutYY.txt;done;cat /tmp/OutScan/ncOutYY.txt | grep 'Connection to'>/tmp/OutScan/OpenPortsYY.txt;rm /tmp/OutScan/ncOutYY.txt" #Generic Netcat Port Scanner.

for i in $(seq 0 $(($2-1))) #The numbers of threads. Standard is 9; 10 threads.
do 
        echo $GenPortScanner > nc$i.sh 
	sed "s/YY/$i/g" -i nc$i.sh #We modify the generics parts of the script to explore a determinated range of ports.
	chmod +x nc$i.sh && ./nc$i.sh & #We launch the scripts on the background to achieve simultaneous execution of the scripts.
	echo "[+] Launched nc$i.sh"
done

echo -e "\n[+] Scanner launched. Check progress at 'progress=\$(tail -n1 /tmp/OutScan/ncOut0.txt | cut -d ' ' -f6 | grep '[0-9]');echo \"[+] \$progress from $PortRange\"'."
echo -e "\n[+] When finish: 'cat /tmp/OutScan/OpenPorts*'."
