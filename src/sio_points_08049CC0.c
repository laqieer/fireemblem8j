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

//! FE8U = 0x08048EB8
void PointsSpriteText_LoopIn(struct PointsSpriteTextProc * proc)
{
    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

        // clang-format off
        SetObjAffine(
            1,
            Div(+COS(0) * 16, 0x100), 
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on
    }

    CallARM_PushToSecondaryOAM(proc->x + 0x200, proc->y + 0x100, gObject_32x16, 0x00009350);
    CallARM_PushToSecondaryOAM(proc->x + 0x220, proc->y + 0x100, gObject_32x16, 0x00009354);
    CallARM_PushToSecondaryOAM(proc->x + 0x240, proc->y + 0x100, gObject_16x16, 0x00009358);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
