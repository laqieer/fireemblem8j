#include "global.h"
#include "constants/items.h"
#include "proc.h"
#include "mu.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmarch.h"
#include "bmusailment.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "popup.h"
#include "constants/songs.h"

bool HandlePostActionTraps(ProcPtr proc) {

    if (GetUnitCurrentHp(gActiveUnit) <= 0) {
        return 1;
    }

    if (!GetPickTrapType(gActiveUnit)) {
        return 1;
    }

    gActionData.suspendPointType = 1;
    gActionData.unitActionType = 1;

    WriteSuspendSave(3);

    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_OFF) {
        RefreshUnitSprites();
    }

    return ExecTrap(proc, gActiveUnit, 0);
}
