#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"









//! FE8U = 0x08044F84
void Tactician_PageFadeHBlankHandler(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        return;
    }

    if (vcount < 40)
    {
        REG_BLDCNT = 0x840;
        REG_BLDALPHA = 0xF08;
    }
    else
    {
        REG_BLDCNT = 0x442;
        REG_BLDALPHA = ((15 - gUnk_41) << 8) + gUnk_41;
    }

    return;
}

void Tactician_PageFade_Init(struct ProcTactician * proc)
{
    proc->unk3A = 0;
    SetPrimaryHBlankHandler(Tactician_PageFadeHBlankHandler);
    return;
}

//! FE8U = 0x08044FFC
void Tactician_PageFadeOut_Loop(struct ProcTactician * proc)
{
    gUnk_41 = Interpolate(INTERPOLATE_LINEAR, 15, 0, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        Proc_Break(proc);
    }

    return;
}
