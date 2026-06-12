#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern s16 gSioPoints_6[];
extern s16 gSioPoints_7[];

// clang-format on

/**
 * Effect where the score numbers "emerge" from the unit
 */

//! FE8U = 0x08048B78
void PointsNumberMover_LoopNumberEmerge(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on
    }

    if (proc->unk_40 != 0 && proc->timer > 3 && proc->timer < 23)
    {
        int idx = proc->timer - 4;

        if (unit->xPos == 8)
        {
            proc->x = proc->x + gSioPoints_6[idx];
        }
        else
        {
            proc->x = proc->x - gSioPoints_6[idx];
        }

        proc->y = proc->y - gSioPoints_7[idx];
    }

    CallARM_PushToSecondaryOAM(proc->x, proc->y + 0x100, gObject_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
