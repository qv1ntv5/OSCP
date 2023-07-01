find / -perm -u=s -type f 2>/dev/null <--- Displays SUID files.
chmod u+s <nombre de archivo> <--- Create a SUID file (useful as root).
/usr/sbin/getcap -r / 2>/dev/null <--- Displays files with capabilities. Useful setuid capability.
