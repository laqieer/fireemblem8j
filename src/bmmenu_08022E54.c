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



u8 AttackMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {

    struct Unit* unit = GetUnit(target->uid);

    ChangeActiveUnitFacing(target->x, target->y);

    if (target->uid == 0) {
        gActionData.xOther = target->x;
        gActionData.yOther = target->y;
        gActionData.trapType = target->extra;

        InitObstacleBattleUnit();
    }

    if (gActionData.itemSlotIndex == BU_ISLOT_BALLISTA) {
        BattleGenerateBallistaSimulation(gActiveUnit, unit, gActiveUnit->xPos, gActiveUnit->yPos);
    } else {
        BattleGenerateSimulation(gActiveUnit, unit, -1, -1, gActionData.itemSlotIndex);
    }

    UpdateBattleForecastContents();

    return 0;
}

int AttackMapSelect_End(ProcPtr proc) {

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    HideMoveRangeGraphics();
    CloseBattleForecast();

    return 0;
}
