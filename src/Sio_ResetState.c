#include "global.h"
#include "sio_core.h"
#include "sio.h"

extern u32 sUnk_1;

void Sio_ResetState(void)
{
    int i;

    gSioSt->unk_000 = 0;
    gSioSt->unk_001 = 0;
    gSioSt->lastSioCnt = 0;
    gSioSt->unk_004 = 0;
    gSioSt->selfId = -1;
    gSioSt->unk_007 = 0;
    gSioSt->recvFlags = 0;
    gSioSt->unk_009 = 0;
    gSioSt->unk_00F = 0;
    gSioSt->unk_010 = 0;
    gSioSt->unk_011 = 0;
    gSioSt->unk_02E = 0;
    gSioSt->unk_00A = 0;

    Sio_SetCommParams(0x6582, 3, 0x88); // JP: 0x6582 (US 0x6584) -- region-different comm param
    Sio_SetSubState(0);
    Sio_ResetSession();

    sUnk_1 = 0;
}
