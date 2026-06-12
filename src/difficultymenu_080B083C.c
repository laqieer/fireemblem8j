#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

extern struct Unknown_08A209FC gDifficultymenu_0[];

extern EWRAM_OVERLAY(0) u8 gPlayStChapterBits[4];
extern EWRAM_OVERLAY(0) u8 gPlayStChapterMode[4];
extern EWRAM_OVERLAY(0) struct PlaySt_OptionBits gPlayStOptionBits[4];

//! FE8U = 0x080ABD88
void SaveMenuInitSlotPalette(u8 slot)
{
    int i;
#ifndef NONMATCHING
    register u32 r1 asm("r1");
#else
    u32 r1;
#endif

    for (i = 0; i < 3; i++)
    {
        u32 flags = gPlayStChapterBits[i] & PLAY_FLAG_HARD ? 4 : 0;

        if (!gPlayStOptionBits[i].controller)
        {
            if (gPlayStChapterMode[i] == 1)
            {
                flags = flags | 0x10;
            }

            if (gPlayStChapterMode[i] == 2)
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }

            if (gPlayStChapterMode[i] == 3)
            {
                flags = flags | 0x40;
            }
        }
        else
        {
            if (gPlayStChapterMode[i] == 3)
            {
                flags = flags | 0x40;
            }
            else
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }
        }

        if (i != slot)
        {
            flags = flags | 2;
            flags = (u8)flags;
        }
        r1 = 1;
        ApplyChapterTitlePal(flags | r1, i * 2 + 0x1a);
        ApplyChapterTitlePal(flags, i * 2 + 0x1b);
    }

    EnablePaletteSync();
}
