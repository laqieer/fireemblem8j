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





//! FE8U = 0x080BE194
s8 GmMuPrim_FinishMovement(struct GMapMuPrimProc * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    if (!proc->flags_0)
    {
        return 0;
    }

    switch (proc->unk_2c)
    {
        case 0x01:
            if ((proc->unk_2d[gWMNodeData].shipTravelFlag & 1) && (proc->unk_2e[gWMNodeData].shipTravelFlag & 1))
            {
                MapUnitC_SetDisplayedClass(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 0);
            }

            MapUnitC_SetPosition(
                ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_2e[gWMNodeData].x,
                proc->unk_2e[gWMNodeData].y + 6);

            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 4);

            gGMData.units[proc->unk_2a].location = proc->unk_2e;

            if (proc->flags_3)
            {
                MapUnitC_GetPosition(
                    ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x1, &y1);
                GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
                gGMData.xCamera = x2;
                gGMData.yCamera = y2;
            }

            break;

        case 0x02:
            MapUnitC_SetPosition(
                ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_4c,
                proc->unk_4e + 6);

            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 4);

            if (proc->flags_3)
            {
                MapUnitC_GetPosition(
                    ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x1, &y1);
                GetWMCenteredCameraPosition(x1, y1 - 0xe, &x2, &y2);
                gGMData.xCamera = x2;
                gGMData.yCamera = y2;
            }

            break;
    }

    proc->flags_0 = 0;
    Proc_Goto(proc, 0);

    return 0;
}
