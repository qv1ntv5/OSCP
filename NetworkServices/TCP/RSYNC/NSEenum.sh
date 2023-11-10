# This command use the default NSE scripts in order to enum rsync server:

nmap -sV --script "rsync-list-modules" -p<PORT> <IP>
