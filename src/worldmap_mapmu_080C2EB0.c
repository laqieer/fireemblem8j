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





//! FE8U = 0x080BE0C8
int GmMu_GetSpriteLayer(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    return MapUnitC_GetLayer(((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b);
}

//! FE8U = 0x080BE0E8
void GmMu_SetSpriteLayer(struct GMapMuProc * muProc, int index, int layer)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_SetLayer(((struct WorldMapMainProc *)(muProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, layer);
    return;
}
