#include "global.h"

extern struct MsgBuffer sMsgString;
extern int sActiveMsg;

char * GetStringFromIndex(int index)
{
    if (index == sActiveMsg)
        return sMsgString.buffer1;
    CallARM_DecompText(gMsgTable[index], sMsgString.buffer1);
    sActiveMsg = index;
    return sMsgString.buffer1;
}
