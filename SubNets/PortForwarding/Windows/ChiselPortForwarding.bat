::In some ocasions (this is specifically true on the exam enviroment), some machines on the internal network such as MS02 can connect back with our kali. We have to do portforwarding through MS01 to make contact MS02 --> Kali.
::In order to do this we use the following command with chisel.

start /b chisel.exe client <tunnelip>:<tunelport> <listeningport>:<targetip>:<targetport>

::This command uses the HTTP tunnel addr and forward the connections landed on <listeningport> to <targetip>:<targetport>. 
::If we try to apply this to the case above, the command would adopte the following scheme:

start /b chisel.exe client <kaliip>:<chiselserverport> <listeningport>:<kaliip>:<targetport>
