#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "sio.h"
#include "sio_core.h"

extern const u8 gSioPoints_3[];
extern const int gSioPoints_5[];

void PointsNumberMover_Init(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    int idx = gSioPoints_1[gSioSt->selfId][proc->playerId];

    if (proc->unk_40 != 0)
    {
        if (unit->xPos == 8) // redundant?
        {
            proc->x = unit->xPos * 16 - 16;
        }
        else
        {
            proc->x = unit->xPos * 16 - 16;
        }

        proc->y = unit->yPos * 16;
    }
    else
    {
        proc->x = unit->xPos * 16 + gSioPoints_5[idx * 2 + 0] - 12;
        proc->y = unit->yPos * 16 + gSioPoints_5[idx * 2 + 1];
    }

    proc->xTarget = gSioPoints_3[idx * 2 + 0] * 8 + 8;
    proc->yTarget = gSioPoints_3[idx * 2 + 1] * 8 + 8;

    SetTextFont(&Font_Sio_0);
    /* gUnk_Sio_1 symbol is bound to a corrupt baseline address (0x4645464e);
       its JP literal-pool address is 0x02000C78 -- reference it raw. */
    SioDrawNumber((struct Text *)0x02000C78, proc->playerId * 32 + 24, TEXT_COLOR_SYSTEM_BLUE, proc->difference);

    proc->timer = 0;

    return;
}
