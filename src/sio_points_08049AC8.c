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

// clang-format off

extern const u8 gSioPoints_0[][4];





extern const u8 gSioPoints_3[];

// clang-format off

extern u16 CONST_DATA Sprite_SioPoints_0[];

//! FE8U = 0x08048CB8
void PointsNumberMover_LoopMoveToPointsBox(struct PointsNumberMoverProc * proc)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, proc->x, proc->xTarget, proc->timer, 0x30);
    int y = Interpolate(INTERPOLATE_RCUBIC, proc->y, proc->yTarget, proc->timer, 0x30);

    CallARM_PushToSecondaryOAM(x, y, gObject_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x20)
    {
        Proc_Break(proc);
    }

    return;
}
