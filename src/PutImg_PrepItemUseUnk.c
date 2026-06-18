#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08098C3C
void PutImg_PrepItemUseUnk(int vram, int pal)
{
    u16 * Pals_PrepWindow[] =
    {
        Pal_PrepWindowA,
        Pal_PrepWindowB,
        Pal_PrepWindowC,
        Pal_PrepWindowD,
    };

    Decompress(Img_PrepWindow, BG_CHR_ADDR(0x0) + vram);
    ApplyPalette(Pals_PrepWindow[gPlaySt.config.windowColor], pal);
    return;
}
