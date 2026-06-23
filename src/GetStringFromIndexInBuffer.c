#include "global.h"

char * GetStringFromIndexInBuffer(int index, char *buffer)
{
    CallARM_DecompText(gMsgTable[index], buffer);
    return buffer;
}
