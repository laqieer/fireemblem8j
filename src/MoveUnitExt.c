#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "muctrl.h"

void MoveUnitExt(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct Vec2 pos;

    const struct REDA * reda = redas - 1 + count;

    pos.x = reda->x;
    pos.y = reda->y;

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    AdjustNewUnitPosition(unit, &pos, flags);

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    UnitFinalizeMovement(unit);

    if (!(unit->state & US_UNDER_A_ROOF))
    {
        unit->state &= ~US_HIDDEN;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }
}
