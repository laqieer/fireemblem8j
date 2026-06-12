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

void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc * proc)
{
    int wtArrowA = 0;
    int wtArrowB = 0;

    if (gBattleActor.wTriangleHitBonus > 0) {
        wtArrowA = 1;
    }

    if (gBattleActor.wTriangleHitBonus < 0) {
        wtArrowA = 2;
    }

    if (gBattleTarget.wTriangleHitBonus > 0) {
        wtArrowB = 1;
    }

    if (gBattleTarget.wTriangleHitBonus < 0) {
        wtArrowB = 2;
    }

    if (wtArrowB != 0) {
        UpdateStatArrowSprites((proc->x + 8) * 8 + 3, (proc->y + 11) * 8, wtArrowB == 2 ? 1 : 0);
    }

    if (wtArrowA != 0) {
        UpdateStatArrowSprites((proc->x + 2) * 8 + 3, (proc->y + 1) * 8, wtArrowA == 2 ? 1 : 0);
    }
}
