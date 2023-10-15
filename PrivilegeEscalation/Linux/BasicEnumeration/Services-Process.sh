ps -aux # <--- Snapshot about current running process in system.
#Packages Managers: (dpkg -l in debian for example). Displays installed aplications.
find / -writable -type d 2>/dev/null #<--- Writeable archives.

#We also can use the pspy (https://github.com/DominicBreuker/pspy) tool to check the behaviour of the process without root permissions. Very useful to check scheduled tasks or things of the kind.
