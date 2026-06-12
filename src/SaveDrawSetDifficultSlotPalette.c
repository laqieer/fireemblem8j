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
/* TU-private data externs bound at their JP addresses */
extern u16 gUnkData_43[];
extern u16 gUnkData_44[];
extern u16 gUnkData_45[];
extern u16 gUnkData_46[];

//! FE8U = 0x080ABE3C
void SaveDrawSetDifficultSlotPalette(int param_1, int param_2)
{
    int slot;
    u16 * r6;
    u16 * r8;
    int r9;
    u16 * ip;
    // permuter
    u16 * pickle = gUnkData_45;
    u16 * ketchup = gUnkData_43;

    param_1 = (param_1 >> 1) & 0x1f;
    if (param_1 > 0x10)
        param_1 = 0x10 - (param_1 & 0xf);

    for (slot = 0; slot < 3; slot++)
    {
        int tmp;
        if (!(gPlayStChapterBits[slot] & PLAY_FLAG_HARD))
            continue;

        tmp = (slot * 0x20 + 0xa0);
        r8 = &gPaletteBuffer[tmp + 0x109];

        if (slot == param_2)
        {
            ip = ketchup;
            r6 = pickle;
        }
        else
        {
            ip = gUnkData_44;
            r6 = gUnkData_46;
        }

        for (r9 = 0; r9 < 7; r9++)
        {
            *r8 =
                ((((*ip & 0x1f) * param_1 + (0x10 - param_1) * (*r6 & 0x1f)) >> 4) & 0x1f) +
                ((((*ip & 0x3e0) * param_1 + (0x10 - param_1) * (*r6 & 0x3e0)) >> 4) & 0x3e0) +
                ((((*ip & 0x7c00) * param_1 + (0x10 - param_1) * (*r6 & 0x7c00)) >> 4) & 0x7c00);
            ++r8;
            ++ip;
            ++r6;
        }
    }

    EnablePaletteSync();
}
