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
extern u16 gMenuMainObjs_0[];

//! FE8U = 0x080AC4F8
void DifficultyMenu_UpdateModePalettes(u8 frameMaybe, u8 selectedIdx)
{
    int i;
    int palId;
    int color;
    s16 var; // by permuter

    for (i = 0; i < 3; i++)
    {
        if (i == selectedIdx)
        {
            var = i * 0x20;
            PAL_OBJ_COLOR(5 + i * 2, 1) = (gMenuMainObjs_0 + var)[1];
        }
        else
            PAL_OBJ_COLOR(6 + i * 2, 1) = (gMenuMainObjs_0 + i * 0x20)[0x10 + 1];
    }

    color = (frameMaybe % 0x40) / 4;
    gPaletteBuffer[((5 + 0x10) * 0x10 + 1) + selectedIdx * 0x20] = Pal_MenuSaveMainBg_0[color];
    EnablePaletteSync();
}
