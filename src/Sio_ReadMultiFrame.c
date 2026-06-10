#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u16 sReadCursor[4];
extern u16 sRecvCursor[4];

int Sio_ReadMultiFrame(int unused_0, u16 * arg_1)
{
    int i;

    if (sReadCursor[0] == sRecvCursor[0])
    {
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;

        return -2;
    }

    for (i = 0; i < 4; i++)
    {
        *arg_1++ = gSioIncoming[sReadCursor[i]][i];

        sReadCursor[i] += 1;
        sReadCursor[i] &= 0x1FF;
    }

    return 0;
}
