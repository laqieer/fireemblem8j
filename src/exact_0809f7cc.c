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
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"



//! FE8U = 0x0809D530
void PrepItemSupply_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 12)
    {
        REG_BLDCNT = (BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
        // FIXME: No cast
        *(vu16*)(REG_ADDR_BLDY) = 8;
    }

    if ((vcount == 52) || (vcount == 0))
    {
        REG_BLDCNT = 0;
        // FIXME: No cast
        *(vu16*)(REG_ADDR_BLDY) = 0;
    }
}
