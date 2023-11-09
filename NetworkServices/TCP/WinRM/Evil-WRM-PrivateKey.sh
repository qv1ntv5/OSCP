# If we have a private key and a cert we can access without password:

evil-winrm [-S] -i <IP> -u <username> -k <privatekey>.pem -c <cert>.crt 
