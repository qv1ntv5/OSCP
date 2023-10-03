#If we discovered credentials from crackmapexec that displays 'pawn3d' flag for winrm we can attemp to login with the following command:
#
evilwinrm -i <ip> -u <username> -p '<password>'

#In the field username we must try the following things in case of error:
# user
# domain.com/user
# domain.com\user
# domain/user
# domain\user
