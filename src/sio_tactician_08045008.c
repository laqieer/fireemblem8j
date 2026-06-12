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

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

//! FE8U = 0x08045068
void Tactician_PageFadeIn_Loop(struct ProcTactician * proc)
{
    gUnk_41 = Interpolate(INTERPOLATE_LINEAR, 0, 15, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
    }

    return;
}
