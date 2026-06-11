#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 gWorldmapMapmu_5[];
extern u16 gWorldmapMapmu_6[];
extern u16 gWorldmapMapmu_4[];
extern u16 gWorldmapMapmu_3[];
extern u16 gWorldmapMapmu_7[];
extern u16 gWorldmapMapmu_2[];

extern struct Struct02003BE8 gUnk_15[];

extern u16 gUnk_13[];
extern int gUnk_14[];





/* prototypes for same-file helpers called by this run */
int GmMuPrim_CalcMoveDuration(int a, int b);
s8 GmMuPrim_TrackMovementDelta(struct GMapMuPrimProc * proc);
int GmMuPrim_GetMovementFacing(struct GMapMuPrimProc * proc);
void GmMuPrim_PlayStepSfx(struct GMapMuPrimProc * proc);

//! FE8U = 0x080BD740
void GmMuPrim_UpdateMovement(struct GMapMuPrimProc * proc)
{
    int animId;
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    if (!GmMuPrim_TrackMovementDelta(proc))
    {
        return;
    }

    if (proc->flags_5)
    {
        GmMuPrim_PlayStepSfx(proc);
        if ((proc->flags_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
        {
            GmMuPrim_PlayStepSfx(proc);
        }
    }

    animId = GmMuPrim_GetMovementFacing(proc);

    if (((animId >= 0) &&
         (MapUnitC_GetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b) != animId)) &&
        (proc->flags_4))
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, animId);
        MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);
    }

    if (proc->flags_3)
    {
        MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x1, &y1);
        GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
        gGMData.xCamera = x2;
        gGMData.yCamera = y2;
    }

    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &proc->unk_44, &proc->unk_46);

    return;
}

//! FE8U = 0x080BD830
void GmMuPrim_1(struct GMapMuPrimProc * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;
    int coord[2];

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
        Spline_Eval(&gUnk_15[proc->unk_2a], proc->unk_54 * 0x1000, coord);
        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, coord[0] >> 4, (coord[1] >> 4) + 6);
        GmMuPrim_UpdateMovement(proc);
    }
    else
    {
        if ((proc->unk_2d[gWMNodeData].shipTravelFlag & 1) && (proc->unk_2e[gWMNodeData].shipTravelFlag & 1))
        {
            MapUnitC_SetDisplayedClass(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 0);
        }

        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_2e[gWMNodeData].x,
            proc->unk_2e[gWMNodeData].y + 6);

        if ((proc->flags_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_32);
        }

        gGMData.units[proc->unk_2a].location = proc->unk_2e;

        if (proc->flags_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x1, &y1);
            GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);

        proc->flags_0 = 0;
    }

    return;
}

//! FE8U = 0x080BD9D8
void GmMuPrim_2(struct GMapMuPrimProc * proc)
{

    if (proc->unk_50 < 0)
    {
        proc->unk_50 = GmMuPrim_CalcMoveDuration(
            proc->unk_4c[gWMNodeData].x - proc->unk_48[gWMNodeData].x,
            proc->unk_4e[gWMNodeData].y - proc->unk_4a[gWMNodeData].y);
    }

    proc->unk_54 = 0;

    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &proc->unk_44, &proc->unk_46);

    if (proc->unk_31 >= 0)
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_31);
    }

    proc->unk_40 = 0;

    return;
}
