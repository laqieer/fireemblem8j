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





//! FE8U = 0x080BE054
void GmMu_PauseMovement(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->flags_1 = 1;
    return;
}

//! FE8U = 0x080BE068
void GmMu_ResumeMovement(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->flags_1 = 0;
    return;
}
