nc -nvv -w 1 -z [-u] <ip> <startport-endport> #<--- Scan a TCP range port only testing if is up. -u flag for UDP scan.

#Example of use; nc -nvv -w 1 -z 192.168.213.151 1-10000 &> /tmp/ncout.txt; cat /tmp/ncout.txt | grep open && rm /tmp/ncout.txt
