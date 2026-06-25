#include "global.h"

#include "proc.h"
#include "sio_core.h"
#include "sio.h"

extern struct SioMessage gUnk_73;

void sub_8002DE4(ProcPtr proc);

void sub_8048B10(ProcPtr proc)
{
    int i;
    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
        return;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
            numTimeouts++;
    }

    if (!Sio_CheckLinkAlive() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Proc_Goto(proc, 10);
        return;
    }

    gUnk_73.kind = 0xCC;
    gUnk_73.sender = gSioSt->selfId;
    gUnk_73.param = gSioSt->unk_000;
    SioSend(&gUnk_73, 10);

    if ((gSioSt->unk_009 & 3) == 3)
    {
        gSioSt->unk_009 = 3;
        SioClearOutgoingQueue();

        gSioSt->unk_004 = 6;
        gSioSt->unk_01E = 0;

        Sio_SetSubState(3);
        sub_8002DE4(proc);
    }
}
