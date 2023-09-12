Windows Library Client Side Attacks are a phising-type attack which rely of the use of the Windows Library files. 
This files act as virtual containers for users that conect remote content (like a webserver or a remote share) with them.

The logic of the attack follow to steps;

- On the first step the user receive (by email, smbshare or by file uploading) the Windows Library file which act (once open) as a directory to a share in our control.
- In the second part, the user is convinced to clic onto the malicious link within the Windows Library file wich trigger a reverse shell to our computer giving us access to the machine.

When we send the malware to the victim we must ensure that all the elements necesary to perform the attack (webDAV share, python web server if we download powercat, netcat listener) are setted.


In a more descriptive way. The steps are the following:

- First we setup a webDAV share on our kali machine.
- Then in the webDAV share we store a link object (.lnk) file crafted in a Windows OS which trigger reverse shell to us when is executed. More information in the setupwebDAV file.
- Then we setup all the devices necesaries for the payload to work (python3 server if we attemp to download powercat, netcat listener etc)
- Then we craft the Windows Library file and transfer it to the victim
