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
void GmMu_SetPosition(struct GMapMuProc * muProc, int index, s16 xBase, s16 yBase);

//! FE8U = 0x080BE3A0
void GmMu_GetPosition(struct GMapMuProc * muProc, int index, s16 * x, s16 * y)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_GetPosition(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, x, y);
    *y -= 6;
    return;
}

//! FE8U = 0x080BE3C8
void GmMu_SetNode(struct GMapMuProc * muProc, int index, int nodeId)
{
    GmMu_SetPosition(muProc, index, nodeId[gWMNodeData].x, nodeId[gWMNodeData].y);
    return;
}
