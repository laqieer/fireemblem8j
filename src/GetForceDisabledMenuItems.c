#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"


extern struct MenuItemOverride sMenuOverrides[];

void GetForceDisabledMenuItems(u8 list[MENU_OVERRIDE_MAX])
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
    {
        if (sMenuOverrides[i].kind && sMenuOverrides[i].func == MenuAlwaysNotShown)
            list[i] = sMenuOverrides[i].cmdid;
        else
            list[i] = MENU_ITEM_NONE;
    }
}
