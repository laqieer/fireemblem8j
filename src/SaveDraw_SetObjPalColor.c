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

//! FE8U = 0x080AAB78
void SaveDraw_SetObjPalColor(u8 flag, u16 color)
{
    if (flag != 0)
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, ((color >> 2) & 0xf));
    }
    else
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, 13);
    }

    EnablePaletteSync();

    return;
}
