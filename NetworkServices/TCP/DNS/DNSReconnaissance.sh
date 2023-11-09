##########################################################################
#First we perform a machine enumeration in order to discover DNS servers on the red:

for ip in $(nmap -sn 10.10.10.0/24 | grep for | cut -d " " -f5); do sudo nmap -sU -p53 -T5 $ip | grep open -C6 | grep for | cut -d " " -f5;done #We scan the net in search of up hosts and then we get those host which have 53/udp port open.

for ip in $(nmap -sn 10.10.10.0/24 | grep for | cut -d " " -f5); do nmap -p53 -T5 $ip | grep open -C6 | grep for | cut -d " " -f5;done #(This is pretty the same but with 53/tcp, less frecuently).

##############################################################################

#Then with the resulting machines we perform a 'host' inverse lookup:

host <ip> <DNSserver>

##############################################################################

#A one-line version of the above process is:

for dnserver in $(for ip in $(nmap -sn 10.10.10.0/24 | grep for | cut -d " " -f5); do sudo nmap -sU -p53 -T5 $ip | grep -v "open|filtered" | grep open -C6 | grep for | cut -d " " -f5;done); do host <ip> $dnserver;done

##############################################################################

#If we manage to retrieve a domain we can attemp to retrieve the name servers and then attemp a zonetransfer

host -t ns <domain> [dig -t ns <domain>]

dig axfr <domain> @<nameserver>

# Or directly used over it an automated DNS enumeration tool

dnsenum <domain>
