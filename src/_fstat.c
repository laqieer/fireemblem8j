#include "global.h"

int _fstat(int file, char * st)
{
    *(int *)(st + 4) = 0x2000;
    return 0;
}
