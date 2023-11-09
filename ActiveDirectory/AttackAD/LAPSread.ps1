
# If we can read LAPS, we can use the following command to try to read ms-Mcs-AdmPwd atribute and retrieve Administrator password:

Get-ADComputer -Filter 'ObjectClass -eq "computer"' -Property *

