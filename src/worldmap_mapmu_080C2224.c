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

int CONST_DATA gWorldmapMapmu_0[] =
{
    0, 0, 0, 0,
};

int CONST_DATA gWorldmapMapmu_1[] =
{
    0x08001000,
    0x00001000,
    0x00000000,
};

//! FE8U = 0x080BD418
void GmMuPrim_Loop_Null(void)
{
    return;
}

//! FE8U = 0x080BD41C
int GmMuPrim_CalcMoveDuration(int a, int b)
{
    return Sqrt((a * a + b * b) * 16) / 5;
}

//! FE8U = 0x080BD444
void GmMuPrim_0(struct GMapMuPrimProc * proc)
{
    struct Struct02003BE8 * unkSplineStruct;

    if (proc->unk_50 < 0)
    {
        proc->unk_50 = GmMuPrim_CalcMoveDuration(
            proc->unk_2e[gWMNodeData].x - proc->unk_2d[gWMNodeData].x,
            proc->unk_2e[gWMNodeData].y - proc->unk_2d[gWMNodeData].y);
    }

    if (proc->unk_2d[gWMNodeData].shipTravelFlag & 1
        && proc->unk_2e[gWMNodeData].shipTravelFlag & 1)
        MapUnitC_SetDisplayedClass(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 0x50);


    unkSplineStruct = &gUnk_15[proc->unk_2a];

    unkSplineStruct->unk_00 = 0;
    unkSplineStruct->unk_00 = 2;
    unkSplineStruct->unk_04 = gUnk_13 + proc->unk_2a * 0x10;
    unkSplineStruct->unk_08 = gUnk_14 + proc->unk_2a * 0x10;
    unkSplineStruct->unk_0C = (void *)gWorldmapMapmu_0;
    unkSplineStruct->unk_10 = (void *)gWorldmapMapmu_1;
    unkSplineStruct->unk_02 = BuildGmPathSplineData(proc->unk_2d, proc->unk_2e, proc->unk_50, unkSplineStruct->unk_04, unkSplineStruct->unk_08, 4);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_2d[gWMNodeData].x,
        proc->unk_2d[gWMNodeData].y + 6);

    if (proc->unk_31 >= 0)
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, proc->unk_31);

    proc->unk_54 = 0;
    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &proc->unk_44, &proc->unk_46);
    proc->unk_40 = 0;

    return;
}
