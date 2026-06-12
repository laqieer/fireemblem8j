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

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *)(proc->proc_parent))

// clang-format on

//! FE8U = 0x080AA7EC
void SaveDraw_DrawPlayTime(struct SaveDrawProc * proc)
{
    int x;
    int y;
    u16 hours;
    u16 minutes;
    u16 seconds;

    struct SaveMenuProc * saveMenuProc = SAVE_MENU_PARENT(proc);

    // FIXME: Can we avoid the shifts? Is this a cast to u8?
    y = (((0x20 - ((saveMenuProc->unk_2f * 0x20) / 220)) << 0x18) + 0x92000000) >> 0x18;

    x = 143;

    if (saveMenuProc->main_sel_bitfile == 1)
    {
        FormatTime(saveMenuProc->total_time, &hours, &minutes, &seconds);
    }
    else
    {
        FormatTime(saveMenuProc->played_time[saveMenuProc->sus_slot], &hours, &minutes, &seconds);
    }

    PutSpriteExt(13, x + 6, y - 14, Sprite_Savedraw_7, OAM2_PAL(2));

    if (hours > 99)
    {
        PutSpriteExt(13, x + 10, y - 8, SpriteArray_Savedraw_1[(hours / 100)], OAM2_PAL(7));
        hours = hours - ((hours / 100) * 100);
    }

    if (hours > 9)
    {
        PutSpriteExt(13, x + 18, y - 8, SpriteArray_Savedraw_1[(hours / 10)], OAM2_PAL(7));
    }

    PutSpriteExt(13, x + 26, y - 8, SpriteArray_Savedraw_1[(hours % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 34, y - 7, SpriteArray_Savedraw_1[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 42, y - 8, SpriteArray_Savedraw_1[(minutes / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 50, y - 8, SpriteArray_Savedraw_1[(minutes % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 58, y + 1, SpriteArray_Savedraw_0[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 66, y, SpriteArray_Savedraw_0[(seconds / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 74, y, SpriteArray_Savedraw_0[(seconds % 10)], OAM2_PAL(7));

    return;
}
