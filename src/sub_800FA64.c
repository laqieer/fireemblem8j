#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "event.h"
#include "muctrl.h"
#include "muctrl.h"
void LoadUnit_MoveToPosition(struct Unit * unit, const struct UnitDefinition * unitDefition, u16 flags, int unk) {
    int u = (s8)unk;
    if (!unit)
        return;
    if (unitDefition->sumFlag == 1)
        flags |= 0x0002;
    if (!unitDefition->redaCount) {
        MoveUnit_(unit, unitDefition->xPosition, unitDefition->yPosition, flags);
        return;
    }
    if (u == 1 || (unit->state & US_UNDER_A_ROOF))
        MoveUnitExt(unit, unitDefition->redas, unitDefition->redaCount, flags);
    else
        MuCtr_StartDefinedMove(unit, unitDefition->redas, unitDefition->redaCount, flags);
}
