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
s8 GmMuPrim_FinishMovement(struct GMapMuPrimProc * proc);

//! FE8U = 0x080BE330
void GmMu_FinishMovement(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index < 0)
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            GmMuPrim_FinishMovement(muPrimProc);
        }
    }
    else
    {
        muPrimProc = muProc->unk_2c[index];
        GmMuPrim_FinishMovement(muPrimProc);
    }

    return;
}
