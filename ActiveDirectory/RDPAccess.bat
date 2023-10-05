::Habilitate RDP service in current machine.
:: - Requisites: Local administrator on target machine.

C:\Users\Public>reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
C:\Users\Public>netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

::The pretended user maybe must be included in Remote Deskop user group.

::We can test if the service is open checking the port: netstat -ano | findstr 3389
