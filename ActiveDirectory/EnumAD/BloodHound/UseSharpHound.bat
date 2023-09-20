C:\...\> powershell -ep bypass
C:\...\> Import-Module .\Sharphound.ps1
C:\...\> Invoke-BloodHound -CollectionMethod All -OutputDirectory <OUTPUTDIRECTORY> -OutputPrefix "<FILENAME>"
