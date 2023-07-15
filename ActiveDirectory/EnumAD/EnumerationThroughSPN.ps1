##############################################
# Batch.

setspn -L <servicename> #<--- Check the which account the running service is linked at.

#############################################
#PowerView.

Get-NetUser -SPN | select samaccountname,serviceprincipalname # <--- This will enumerate all the accounts on the domain displaying only the SAN and the SPN if exists.
