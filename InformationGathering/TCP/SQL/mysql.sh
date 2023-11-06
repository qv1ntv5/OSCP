#!/bin/bash
read -p "Enter command: " Command #SQL command
mysql -u developer -p<password> $1 -e "$Command;"
#$1 must be the database, if $1 is in blank, Command= show databases.
#mysql -u <USERNAME> -p[<password>] [<DATABASE>] -e "<COMMAND>;" <--- Execute MySQL command from a command-line session (if you are enumerating databases, then DATABASE is not required).
#Check that there is no space between -p flag and the password string.
