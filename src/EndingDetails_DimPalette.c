#include "global.h"
#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"
#include "ending_details.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"




void EndingDetails_DimPalette(u16 * dst, u16 * src, u8 coeff)
{
    int i;

    for (i = 0; i < 0x10; i++)
    {
        *dst = ((((*src & RED_MASK) * coeff) >> 5) & RED_MASK) +
            ((((*src & GREEN_MASK) * coeff) >> 5) & GREEN_MASK) +
            ((((*src & BLUE_MASK) * coeff) >> 5) & BLUE_MASK);
        dst++;
        src++;
    }

    EnablePaletteSync();

    return;
}
