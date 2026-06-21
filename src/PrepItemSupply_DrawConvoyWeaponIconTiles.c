#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"

#define TILEREF_(aChar, aPal) (((aPal) << 12) + (aChar))

//! FE8U
void PrepItemSupply_DrawConvoyWeaponIconTiles(u16 * tm, u32 chr, int pal)
{
    int i;

    for (i = 0; i < 0xf; i++) {
        tm[i] = TILEREF_(((chr) & 0x1ffff) / 0x20, pal) + i;
        tm[0x20 + i] = TILEREF_(((chr + 0x200) & 0x1ffff) / 0x20, pal) + i;
    }
}
