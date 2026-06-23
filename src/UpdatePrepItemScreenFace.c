#include "global.h"

#include "proc.h"
#include "face.h"
#include "bmunit.h"
#include "prepscreen.h"

void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp)
{
    int xx = (s16)x;
    int yy = (s16)y;
    int dd = (u16)(s16)disp;
    struct PrepItemScreenProc * proc = Proc_Find(ProcScr_PrepItemScreen);

    if (proc->pUnits[slot] != unit)
    {
        if (proc->pUnits[slot] != NULL)
        {
            EndFaceById(slot);
        }

        if (unit != NULL)
        {
            StartFace2(slot, GetUnitPortraitId(unit), xx, yy, dd);
        }
    }
    else
    {
        if (unit != NULL)
        {
            SetFacePosition(slot, xx, yy);
            SetFaceDisplayBitsById(slot, dd);
        }
    }

    proc->pUnits[slot] = unit;

    proc->xFacePosBySlot[slot] = xx;
    proc->yFacePosBySlot[slot] = yy;
    proc->faceDispBySlot[slot] = dd;

    return;
}
