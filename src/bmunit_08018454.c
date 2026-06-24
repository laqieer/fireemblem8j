#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmsave.h"

// Force the GetUnitCurrentHp inline expansion (GNU C89 extern inline: no
// out-of-line copy, so no duplicate symbol / layout shift).
extern inline int GetUnitMaxHp(struct Unit* unit)
{
    return unit->maxHP + GetItemHpBonus((u16) GetUnitEquippedWeapon(unit));
}

extern inline int GetUnitCurrentHp(struct Unit* unit)
{
    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);

    return unit->curHP;
}

void MoveActiveUnit(int x, int y)
{
    gActiveUnit->xPos = x;
    gActiveUnit->yPos = y;

    gActiveUnit->state |= US_UNSELECTABLE;

    PidStatsAddSquaresMoved(gActiveUnit->pCharacterData->number, gActionData.moveCount);

    if (GetUnitCurrentHp(gActiveUnit) != 0)
        gActiveUnit->state = gActiveUnit->state &~ US_HIDDEN;

    UnitFinalizeMovement(gActiveUnit);
}
