#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmenu.h"
#include "playerphase.h"
#include "uichapterstatus.h"
#include "uiselecttarget.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "icon.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmidoten.h"
#include "uiutils.h"
#include "bksel.h"
#include "bmbattle.h"
#include "bmdifficulty.h"
#include "bmitemuse.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "bmtrick.h"
#include "mu.h"
#include "bmarch.h"
#include "event.h"
#include "bb.h"
#include "bmarena.h"
#include "face.h"
#include "uiconfig.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "prepscreen.h"
#include "bmguide.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "unitlistscreen.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/items.h"
#include "constants/songs.h"

u8 RideCommandUsability(const struct MenuItemDef* def, int number) {
    struct Trap* trap;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE)) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & (US_RESCUING | US_RESCUED | US_IN_BALLISTA)) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_BALLISTA) {
        return MENU_NOTSHOWN;
    }

    trap = GetTrapAt(gActiveUnit->xPos, gActiveUnit->yPos);

    if (trap == 0) {
        return MENU_NOTSHOWN;
    }

    if (trap->type != 1) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}
