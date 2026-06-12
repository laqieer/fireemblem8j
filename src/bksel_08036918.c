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
void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit);
void PutBattleForecastItemName(u16* dest, struct Text * text, int itemIdx);

void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc)
{
    int damage;
    int critRate;

    CallARM_FillTileRect(gUiTmScratchB, gTSA_BattleForecastStandard, 0x1000);

    TileMap_FillRect(gUiTmScratchA, 10, 15, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);

    PutBattleForecastUnitName(gUiTmScratchA + 0x161, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x1A1, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (gBattleTarget.weaponBroke == 0)) {
        damage = -1;

        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    } else {
        damage = gBattleTarget.battleAttack - gBattleActor.battleDefense;

        if (damage < 0) {
            damage = 0;
        }
    }

    if (gBattleTarget.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveCritRate);

    damage = gBattleActor.battleAttack - gBattleTarget.battleDefense;

    if (GetItemIndex(gBattleActor.weapon) == ITEM_MONSTER_STONE) {
        damage = 0xFF;
    }

    if (damage < 0) {
        damage = 0;
    }

    critRate = gBattleActor.battleEffectiveCritRate;

    if (GetItemIndex(gBattleActor.weapon) == ITEM_MONSTER_STONE) {
        critRate = 0xFF;
    }

    if (critRate < 0) {
        critRate = 0;
    }

    if (gBattleActor.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, gBattleActor.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, critRate);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs, gUiTmScratchA  + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA  + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA  + 0xA8 + 0x7B);

    DrawIcon(gUiTmScratchA + 0xA8 + 0xBF, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}
