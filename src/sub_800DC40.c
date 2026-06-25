#include "global.h"
#include "event.h"

//! JP 0x0800DC40 = fe8u Event0A_Call (eventscr.c)
u8 Event0A_Call(struct EventEngineProc * proc)
{
    s8 i;
    int dst = EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if (dst < 0)
        dst = gEventSlots[2];

    for (i = 7; i > 0; i--)
    {
        gEventActiveQueue[i].evt1 = gEventActiveQueue[i - 1].evt1;
        gEventActiveQueue[i].evt2 = gEventActiveQueue[i - 1].evt2;
    }

    gEventActiveQueue[0].evt1 = proc->pEventIdk;
    gEventActiveQueue[0].evt2 = proc->pEventCurrent;

    proc->pEventIdk = (const u16 *)dst;
    proc->pEventCurrent = (const u16 *)dst;
    return EVC_UNK4;
}
