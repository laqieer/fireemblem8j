#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "statscreen.h"
#include "bmlib.h"
#include "unitlistscreen.h"

void UnitList_SetCursorToUnit(struct UnitListScreenProc * proc, s8 unk)
{
    int i;

    int unitId;
    int flag = unk;

    if (flag != 0)
    {
        unitId = PrepGetLatestCharId();
    }
    else
    {
        unitId = GetLastStatScreenUid();
    }

    for (i = 0; i < gUnitlistscreen_8; i++)
    {
        if (flag != 0)
        {
            if (gSortedUnits[i]->unit->pCharacterData->number == unitId)
                goto _080904FC;

            continue;
        }
        else
        {
            if (gSortedUnits[i]->unit->index == unitId)
                goto _080904FC;

            continue;
        }

    _080904FC:
        proc->unk_30 = i;

        if (i == 0)
        {
            proc->unk_2c = 0;
            proc->unk_3e = 0;
            return;
        }

        if (i == gUnitlistscreen_8 - 1)
        {
            if (gUnitlistscreen_8 < 7)
            {
                proc->unk_2c = i;
                proc->unk_3e = 0;
                return;
            }
            else
            {
                proc->unk_2c = 5;
                proc->unk_3e = (gUnitlistscreen_8 - 6) * 16;
                return;
            }
        }

        if (i > proc->unk_3e / 16 && i < proc->unk_3e / 16 + 5)
        {
            proc->unk_2c = i - proc->unk_3e / 16;
            return;
        }

        if (proc->unk_3e > (i - 1) * 16)
        {
            proc->unk_2c = 1;
            proc->unk_3e = (i - 1) * 16;
            return;
        }

        if (proc->unk_3e < (i - 4) * 16)
        {
            proc->unk_2c = 4;
            proc->unk_3e = (i - 4) * 16;
            return;
        }

        return;
    }
}
