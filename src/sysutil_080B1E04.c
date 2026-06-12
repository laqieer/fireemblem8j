#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void DisplayExtendedSysHand(struct SysHandCursorProc * proc)
{
    int i;

    gPaletteBuffer[proc->pal_bank * 0x10  + 0x10E] =
        ((gPlaySt.config.windowColor << 4) + ((GetGameClock() / 4) % 0x10))[Pal_UnkData_1];

    EnablePaletteSync();
    PutSpriteExt(4, proc->x, proc->y + 8, gObject_8x8,
        OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr);

    for (i = 1; i < proc->shadow_len; i++)
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8, gObject_8x8,
            OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr + 1);

    PutSpriteExt(4, proc->x + proc->shadow_len * 8, proc->y + 8, gObject_8x8,
        OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr + 2);
}
