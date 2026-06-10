#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void DrawStatWithBar(int num, int x, int y, int base, int total, int max)
{
    int diff = total - base;

    PutNumberOrBlank(gUiTmScratchA + TILEMAP_INDEX(x, y),
        (base == max) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE, base);

    PutNumberBonus(diff, gUiTmScratchA + TILEMAP_INDEX(x + 1, y));

    if (total > 30)
    {
        total = 30;
        diff = total - base;
    }

    DrawStatBarGfx(0x401 + num*6, 6,
        gUiTmScratchC + TILEMAP_INDEX(x - 2, y + 1),
        TILEREF(0, STATSCREEN_BGPAL_6), max * 41 / 30, base * 41 / 30, diff * 41 / 30);
}
