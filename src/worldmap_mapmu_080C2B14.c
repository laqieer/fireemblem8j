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
void MapMUPrim_RemoveLinkedMapUnit(struct GMapMuPrimProc * proc);
int GmMuPrim_CalcMoveDuration(int a, int b);

//! FE8U = 0x080BDD2C
void GmMu_RemoveUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2b >= 0)
    {
        muPrimProc->unk_2a = -1;
        MapMUPrim_RemoveLinkedMapUnit(muPrimProc);

        if (gGMData.units[index].state & 2)
        {
            gGMData.units[index].id = 0;
            gGMData.units[index].state |= 2;
        }
        else
        {
            gGMData.units[index].id = 0;
            gGMData.units[index].state &= ~2;
        }

        gGMData.units[index].state &= ~1;
    }

    return;
}

//! FE8U = 0x080BDD94
void GmMu_RemoveLinkedUnits(struct GMapMuProc * muProc, int index)
{
    int i;
    struct GMapMuPrimProc ** pMuPrimProc;

    if (index >= 0)
    {
        MapMUPrim_RemoveLinkedMapUnit(muProc->unk_2c[index]);
    }
    else
    {
        pMuPrimProc = muProc->unk_2c;
        for (i = 0; i < 7; i++)
        {
            MapMUPrim_RemoveLinkedMapUnit(pMuPrimProc[i]);
        }
    }

    return;
}

//! FE8U = 0x080BDDC4
void GmShowMuUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index >= 0)
    {
        muPrimProc = muProc->unk_2c[index];
        MapUnitC_SetDisplayEnabled(((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, 1);
        gGMData.units[index].state |= 1;
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            if (muPrimProc->unk_2b >= 0)
            {
                MapUnitC_SetDisplayEnabled(
                    ((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, 1);
                gGMData.units[i].state |= 1;
            }
        }
    }

    return;
}

//! FE8U = 0x080BDE3C
void GmHideMuUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index >= 0)
    {
        muPrimProc = muProc->unk_2c[index];
        MapUnitC_SetDisplayEnabled(((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, 0);
        gGMData.units[index].state &= ~1;
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            if (muPrimProc->unk_2b >= 0)
            {
                MapUnitC_SetDisplayEnabled(
                    ((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, 0);
                gGMData.units[i].state &= ~1;
            }
        }
    }

    return;
}

//! FE8U = 0x080BDEB4
void GmMu_StartMoveBetweenNodes(struct GMapMuProc * muProc, struct UnknownSub80BDEB4 * input)
{
    int unkA;
    int unkB;

    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[input->unk_00];

    muPrimProc->unk_2d = input->unk_06;
    muPrimProc->unk_2e = input->unk_08;

    unkA = input->unk_0c;

    if (unkA < 0)
    {
        int tmp = GmMuPrim_CalcMoveDuration(
            ABS(muPrimProc->unk_2e[gWMNodeData].x - muPrimProc->unk_2d[gWMNodeData].x),
            ABS(muPrimProc->unk_2e[gWMNodeData].y - muPrimProc->unk_2d[gWMNodeData].y));

        unkB = input->unk_0c;

        if (unkB < 0)
        {
            unkB = -unkB;
        }

        unkA = tmp * unkB;
    }

    muPrimProc->unk_50 = unkA;

    muPrimProc->flags_2 = input->unk_01;
    muPrimProc->unk_42 = input->unk_0a;

    muPrimProc->flags_0 = 1;
    muPrimProc->flags_1 = 0;
    muPrimProc->unk_2c = 1;
    muPrimProc->flags_4 = 1;
    muPrimProc->flags_5 = input->unk_02;
    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = input->unk_03;
    muPrimProc->unk_32 = input->unk_04;

    Proc_Goto(muPrimProc, 1);

    return;
}
