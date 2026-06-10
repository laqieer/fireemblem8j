#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u16 sSendCursor;
extern u16 sWriteCursor;
extern u16 sReadCursor[4];
extern u16 sRecvCursor[4];

void Sio_StartLinkSessionFast(void)
{
    int i;

    u16 abc = 0x2586;

    gSioSt->unk_004 = 0;
    gSioSt->unk_001 = 0;
    gSioSt->unk_1B7C = 24;

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 6;

    SioSend16(&abc, -1);
}
