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

//! FE8U = 0x080BC4F4
int WMMenu_OnGuideDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (!(menuProc->state & MENU_STATE_NOTSHOWN))
    {
        if (!BmGuideTextShowGreenOrNormal())
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GREEN);
        }

        if (menuItemProc->availability == MENU_DISABLED)
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GRAY);
        }

        Text_DrawString(&menuItemProc->text, *(const char **)menuItemProc->def);

        PutText(
            &menuItemProc->text,
            BG_GetMapBuffer(menuProc->frontBg) + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile)
        );
    }

    // return 0; // BUG?
}
