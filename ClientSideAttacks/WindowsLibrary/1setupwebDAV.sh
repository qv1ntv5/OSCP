/home/kali/.local/bin/wsgidav --host=0.0.0.0 --port=80 --auth=anonymous --root <pathtoshare>

# For example; 
# mkdir /home/kali/webdav
# /home/kali/.local/bin/wsgidav --host=0.0.0.0 --port=80 --auth=anonymous --root /home/kali/webdav/
#
# This is the webDAV shared folder, the contents of this folder will be shared with the user when the .Library-ms file is opened. 
# Because of this, the content must be a .lnk file created in a Windows OS enviroment. The best way to achieve this .lnk file is in a Windows Desktop: Right-click > New > Shortcut and as entity we past the command that will be executed on the machine, the payload: One-liner powershell reverse shell, powercat reverse shell, etc. More information consulting the payload folder.
# Then we clic next and set the name of the link.
