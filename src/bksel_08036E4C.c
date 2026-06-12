#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

extern EWRAM_OVERLAY(0) struct Text gaBattleForecastTextStructs[6];
extern EWRAM_OVERLAY(0) u16 gBkselPals[8][16];

/* prototypes for same-file helpers called by this run */
const u16 * GetFactionBattleForecastFramePalette(int faction);

void InitBattleForecastFramePalettes(void)
{

    ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleActor.unit)), 1);

    if (gBattleTarget.unit.index != 0) {
        ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleTarget.unit)), 2);
    } else {
        ApplyPalette(GetFactionBattleForecastFramePalette(FACTION_PURPLE), 2);
    }
}
