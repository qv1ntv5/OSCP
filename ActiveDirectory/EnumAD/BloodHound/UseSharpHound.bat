C:\...\> powershell -ep bypass
C:\...\> Import-Module .\Sharphound.ps1
C:\...\> Invoke-BloodHound -CollectionMethod All -OutputDirectory <OUTPUTDIRECTORY> -OutputPrefix "<FILENAME>"

::Sometimes, Invoke-Bloodhound can trigger an error about LDAP invalid creds. In those cases we can apport our user credentials (username, password) via -ldapusername and  -ldappassword flags but that doesn't always solve the problem.
::For example; Invoke-BloodHound -CollectionMethod All -OutputDirectory C:\Users\Public -OutputPrefix "Audit_MEDTECH" -LdapUsername joe -Ldappassword Flowers1
