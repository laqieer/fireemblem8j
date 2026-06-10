#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u16 sSendCursor;
extern u16 sWriteCursor;
extern u16 sReadCursor[4];
extern u16 sRecvCursor[4];

void Sio_BeginSyncPhase(void)
{
    int i;

    u16 abc = 0x7FFF;

    gSioSt->unk_001 = 0;
    gSioSt->unk_1B7C = 0;

    SioSend16(&abc, 1);

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }

    gSioSt->unk_1B7E = 0;
    gSioSt->unk_001 = 3;
}
