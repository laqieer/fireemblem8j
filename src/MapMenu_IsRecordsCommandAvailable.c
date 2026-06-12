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

u8 MapMenu_IsRecordsCommandAvailable(const struct MenuItemDef* def, int number) {
    u8 chapterId;

    if (GetBattleMapKind() != BATTLEMAP_KIND_DUNGEON) {
        return MENU_NOTSHOWN;
    }

    chapterId = gPlaySt.chapterIndex - 0x24;

    if (chapterId > 9) {
        return MENU_ENABLED;
    }

    if ((CheckFlag(0x71) == 0) ||
        (CheckFlag(0x72) == 0) ||
        (CheckFlag(0x73) == 0) ||
        (CheckFlag(0x74) == 0) ||
        (CheckFlag(0x75) == 0) ||
        (CheckFlag(0x76) == 0) ||
        (CheckFlag(0x77) == 0)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}
