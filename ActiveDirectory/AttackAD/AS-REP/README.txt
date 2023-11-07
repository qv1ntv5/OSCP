Kerberoasting is a technique in which some certains accounts inside an AD network are vulnerable to a request falsification because the DC that receives the request doesn't validate the procedence of the ticket by skiping the 'Kerberos preauthenticaton' step due to a 'Do not require Kerberos preauthentication' option habilitated. Thus, for certains accounts with 'Do not requiere Kerberos preauthentication' option habilitated, we can stole their hash by request with AS-REQ an AS-REP with they hash implicit on it.

Both tools, 'Rubeus' and 'impacket-GetNPUsers' will attemp to enumerate thoses users vulnerables to AS-REP Roasting and in case there are users, they will extract their hashesh from the AS-REP ticket granted by the DC and store it in a file.

IMPORTANT!

We can use Impacket-GetNPUsers without need of valid credentials. If we try to use that binary with a valid domain user we can get his TGT without knowing his password.
