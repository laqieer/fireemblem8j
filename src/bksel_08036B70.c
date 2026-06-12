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

void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc)
{
    CallARM_FillTileRect(gUiTmScratchB, gTSA_BattleForecastExtended, 0x1000);

    TileMap_FillRect(gUiTmScratchA, 10, 19, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    PutBattleForecastUnitName(gUiTmScratchA + 0x1E1, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x221, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (!gBattleTarget.weaponBroke)) {
        gBattleTarget.battleAttack = 0xFF;
        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    }

    if (gBattleTarget.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, gBattleTarget.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0xC0, 2, gBattleTarget.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x100, 2, gBattleTarget.battleSpeed);

    if (gBattleActor.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, gBattleActor.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, gBattleActor.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0xC0, 2, gBattleActor.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x100, 2, gBattleActor.battleSpeed);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs + 3, gUiTmScratchA + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 4, gUiTmScratchA + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA + 0xA8 + 0x7B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA + 0xA8 + 0xBB);
    PutText(gaBattleForecastTextStructs + 5, gUiTmScratchA + 0xA8 + 0xFB);

    DrawIcon(gUiTmScratchA + 0xA8 + 0x13F, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}
