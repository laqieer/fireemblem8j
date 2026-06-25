#include "global.h"
#include "event.h"
#include "bmunit.h"

s8 ShouldUNITBeLoaded(const struct UnitDefinition * unitDefinition, u8 unk);
void EventLoadUnitWithMovement(struct EventEngineProc * proc);

void EventLoadUnitWithMovement(struct EventEngineProc * proc)
{
    const struct UnitDefinition * pUnitDefinition = proc->pUnitLoadData;

    s16 count = proc->unitLoadCount;
    u8 param = proc->unitLoadParameter;

    u16 something = ModifyMoveUnitFlag(proc, TRUE);

    s8 r3 = (param == 2) ? TRUE : FALSE;

    if ((proc->evStateBits >> 2) & 1)
    {
        EventLoadUnitSliently(pUnitDefinition, count, param);
    }
    else
    {
        for (; pUnitDefinition->charIndex && count > 0; ++pUnitDefinition)
        {
            if (ShouldUNITBeLoaded(pUnitDefinition, param) != TRUE)
                continue;

            if (!TryPrepareEventUnitMovement(proc, pUnitDefinition->xPosition, pUnitDefinition->yPosition))
            {
                proc->pUnitLoadData = pUnitDefinition;
                proc->unitLoadCount = count;
                return;
            }

            LoadUnit_0(pUnitDefinition, something, FALSE, r3);
            count--;
        }
    }

    proc->unitLoadCount = 0;
    proc->chance = 0;
    proc->pCallback = NULL;
}
