------------------------------------------------
#Check binaries:

which python/python3/script

-------------------------------------------------
#It also works with 'python'.
python3 -c 'import pty; pty.spawn("/bin/bash")'
export TERM=xterm
Ctrl+Z
stty raw -echo;fg

-------------------------------------------
script -qc /dev/null /bin/bash
export TERM=xterm
Ctrl+Z
sttr raw -echo; fg
