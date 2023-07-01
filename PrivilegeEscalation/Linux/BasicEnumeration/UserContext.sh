id <--- Displays username, uid, gid and group membership.
cat /etc/passwd <--- Enumerate accounts on system. Specially relevant are:
#		-> /bin/bash <--- users with login available.
#		-> System services accounts (www-data, sshd, et)c with /usr/sbin/nologin home directory established. It can reveal services active or inactive on the server.
#		-> 0 uid/gid users, equivallent with root.
env <--- Displays current user enviroment variables.
