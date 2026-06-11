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

extern u16 gBattleForecast_2[];

extern u8 gSummonConfig[4][2];



extern struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[];



u8 StealMapSelect_Select(ProcPtr proc, struct SelectTarget* target) {
    int pos;

    gActionData.targetIndex = target->uid;

    ResetIconGraphics();
    LoadIconPalettes(4);

    StartOrphanMenu(&gStealItemMenuDef);

    EndTargetSelection(proc);

    CallARM_FillTileRect(gBG1TilemapBuffer + 0x42, gBattleForecast_2, 0x1000);

    pos = (56 - GetStringTextLen(GetStringFromIndex(GetUnit(gActionData.targetIndex)->pCharacterData->nameTextId))) / 2;

    PutDrawText(0, gBG0TilemapBuffer + 0x63, 0, pos, 7, GetStringFromIndex(GetUnit(gActionData.targetIndex)->pCharacterData->nameTextId));

    PutFace80x72_Core(gBG0TilemapBuffer + 0x63 + 0x40, GetUnitPortraitId(GetUnit(gActionData.targetIndex)), 0x200, 5);

    return 0;
}
