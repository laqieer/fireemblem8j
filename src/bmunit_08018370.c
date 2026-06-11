#include "global.h"

#include <string.h>

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"

extern EWRAM_DATA u8 gActiveUnitId;
EWRAM_DATA struct Vec2 gActiveUnitMoveOrigin = {};

extern EWRAM_DATA struct Unit gUnitArrayBlue[62]; // Player units
extern EWRAM_DATA struct Unit gUnitArrayRed[50]; // Red units
extern EWRAM_DATA struct Unit gUnitArrayGreen[20]; // Purple units





void UnitBeginAction(struct Unit* unit) {
    gActiveUnit = unit;
    gActiveUnitId = unit->index;

    gActiveUnitMoveOrigin.x = unit->xPos;
    gActiveUnitMoveOrigin.y = unit->yPos;

    gActionData.subjectIndex = unit->index;
    gActionData.unitActionType = 0;
    gActionData.moveCount = 0;

    gBmSt.taken_action = 0;
    gBmSt.unk3F = 0xFF;

    ClearBmbattleStruct0();

    gActiveUnit->state |= US_HIDDEN;
    gBmMapUnit[unit->yPos][unit->xPos] = 0;
}

void UnitBeginCantoAction(struct Unit* unit) {
    gActiveUnit = unit;
    gActiveUnitId = unit->index;

    gActiveUnitMoveOrigin.x = unit->xPos;
    gActiveUnitMoveOrigin.y = unit->yPos;

    gActionData.unitActionType = 0;

    gBmSt.taken_action = 0;

    ClearBmbattleStruct0();

    gActiveUnit->state |= US_HIDDEN;
    gBmMapUnit[unit->yPos][unit->xPos] = 0;
}
