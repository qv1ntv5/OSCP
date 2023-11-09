# The following command list recursively with the -r flag the <share> with <n> depth loops and send the stdout to <outfile>

smbmap -r <share> -H <ip> --depth <n> -g <outfile>.txt [-u <USERNAME> -p <PASSWORD>]

# Once we have the output in a file we can quicly extract the files (skipping the directories) with:

cat <outfile>.txt | grep -v 'fileSize:0' | grep -v 'NO_ACCESS'  

# For last, if we see a suggestive file we can download it with the following command:

smbmap --download '<smbpathtofile>' -H <ip> [-u <USERNAME> -p <PASSWORD>]

# <smbpathtofile> is required in the format granted by  the <outfile>.txt file.
