#include "global.h"
#include "event.h"
#include "bm.h"
#include "bmmap.h"
#include "bmunit.h"

//! FE8U = 0x0800F41C
u8 Event26_CameraControl(struct EventEngineProc * proc)
{
    s8 x, y;
    struct Unit * unit;

    u8 subcode = EVT_SUB_CMD_LO(proc->pEventCurrent);
    u8 sc2 = EVT_SUB_CMD_HI(proc->pEventCurrent);

    switch (subcode) {
    case 0: // position
        x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

        if (x < 0 || y < 0)
        {
            x = ((u16 *)(gEventSlots + 0xB))[0];
            y = ((u16 *)(gEventSlots + 0xB))[1];
        }

        break;

    case 1:
        unit = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);
        if (!unit)
            return EVC_ERROR;

        x = unit->xPos;
        y = unit->yPos;

        break;
    } // switch (subcode)

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
    {
        SetSomeRealCamPos(x, y, sc2);
        SetCursorMapPosition(x, y);
        RenderBmMap();

        return EVC_ADVANCE_CONTINUE;
    }
    else
    {
        if (!sc2)
            EnsureCameraOntoPosition(proc, x, y);
        else
            EnsureCameraCenteredOnPosition(proc, x, y);

        SetCursorMapPosition(x, y);

        return EVC_ADVANCE_YIELD;
    }
}