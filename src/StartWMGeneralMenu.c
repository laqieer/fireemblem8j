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
extern struct MenuRect gMenuRect_WMGeneralMenuRect;
extern struct MenuDef gMenu_WMGeneralMenu;

//! FE8U = 0x080BC454
struct MenuProc * StartWMGeneralMenu(ProcPtr parent)
{
    gGMData.sprite_disp = 0;
    InitTextFont(&gFont_0, (void *)0x06001000, 0x80, 0);
    return StartMenuAt(&gMenu_WMGeneralMenu, gMenuRect_WMGeneralMenuRect, parent);
}
