#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct Font gFont_0;
extern struct MenuRect gMenuRect_WMNodeMenuRectA;
extern struct MenuRect gMenuRect_WMNodeMenuRectB;
extern struct MenuDef gMenu_WMNodeMenu;

struct MenuProc * StartWMNodeMenu(struct WorldMapMainProc * parent)
{
    struct MenuProc * menuProc;

    gGMData.sprite_disp = 0;

    InitTextFont(&gFont_0, (void *)0x06001000, 0x80, 0);

    if ((gGMData.ix >> 8) - gGMData.xCamera < 152)
    {
        menuProc = StartMenuAt(&gMenu_WMNodeMenu, gMenuRect_WMNodeMenuRectA, parent);
    }
    else
    {
        menuProc = StartMenuAt(&gMenu_WMNodeMenu, gMenuRect_WMNodeMenuRectB, parent);
    }

    if (gGMData.unk_cd < menuProc->itemCount)
    {
        menuProc->itemCurrent = gGMData.unk_cd;
    }
    else
    {
        menuProc->itemCurrent = menuProc->itemCount - 1;
    }

    return menuProc;
}
