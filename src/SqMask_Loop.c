#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

void SqMask_Loop(struct SqMaskProc * proc)
{
    proc->unk_29 += proc->unk_2b;

    SetWinEnable(0, 1, 0);

    if (proc->unk_2a >= 1) {
        SetWin1Box(proc->unk_29 * 3, proc->unk_29 * 2, -0x10 - (proc->unk_29 * 3), -0x60 - (proc->unk_29 * 2));
    } else {
        SetWin1Box(0x78 - (proc->unk_29 * 3), 0x50 - (proc->unk_29 * 2), proc->unk_29 * 3 + 0x78, proc->unk_29 * 2 + 0x50);
    }

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->unk_29 > 0x27) {
        Proc_Break(proc);
    }

    return;
}
