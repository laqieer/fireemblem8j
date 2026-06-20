#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "unitlistscreen.h"
#include "sio.h"

void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc)
{
    int index = proc->unk_30;
    struct Unit * unit = gSortedUnits[index]->unit;

    if ((unit->state & US_BIT25) != 0)
    {
        StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x700, proc);
        return;
    }

    if ((unit->state & US_NOT_DEPLOYED) != 0)
    {
        if (CheckInLinkArena() && !CanUnitBeDeployedLinkArena(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x6FD, proc);
            return;
        }

        if (CheckInLinkArena() && !CanUnitJoinLinkArena(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x6FB, proc);
            return;
        }

        UnitList_DeployUnit(unit, proc);
        return;
    }

    UnitList_UndeployUnit(unit, proc);

    return;
}
