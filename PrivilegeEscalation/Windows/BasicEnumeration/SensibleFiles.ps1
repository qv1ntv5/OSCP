--------------------------------------------
PowerShell

Get-ChildItem -Path <PATH> -Include *.txt,*.pdf,*.xls,*.xlsx,*.doc,*.docx,*.ini -File -Recurse -ErrorAction SilentlyContinue

##########################################
#Batch

ls/dir \\dc1.corp.com\sysvol\corp.com\ # <--- Remote listing.
