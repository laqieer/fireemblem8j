#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

/* defined in worldmap_mapmu_080C252C.c (only commented-out in worldmap.h) */
void GmMuPrim_UpdateMovement(struct GMapMuPrimProc * proc);

//! FE8U = 0x080BDA78
void GmMuPrim_3(struct GMapMuPrimProc * proc)
{
    int coeff;
    s16 x;
    s16 y;
    s16 x2;
    s16 y2;

    if (proc->flags_1)
    {
        return;
    }

    if (proc->unk_42 > 0)
    {
        proc->unk_42--;
        return;
    }

    if ((proc->flags_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
    {
        proc->unk_54 += 2;
    }

    proc->unk_54++;

    if (proc->unk_54 < proc->unk_50)
    {
        coeff = _DivArm2(proc->unk_54, proc->unk_50, proc->unk_2f);
        x = proc->unk_48 + DivArm(0x1000, (proc->unk_4c - proc->unk_48) * coeff);
        y = proc->unk_4a + DivArm(0x1000, (proc->unk_4e - proc->unk_4a) * coeff);
        MapUnitC_SetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, x, y + 6);
        GmMuPrim_UpdateMovement(proc);
    }
    else
    {
        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_4c, proc->unk_4e + 6);

        if ((proc->flags_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_32);
        }

        if (proc->flags_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x, &y);
            GetWMCenteredCameraPosition(x, y - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);
        proc->flags_0 = 0;
    }

    return;
}
