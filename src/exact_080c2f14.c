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





//! FE8U = 0x080BE12C
s8 GmMu_IsMoving(struct GMapMuProc * muProc, int index)
{
    if (index < 0)
    {
        int i;

        for (i = 0; i < 7; i++)
        {
            if ((muProc->unk_2c[i]->unk_2b >= 0) && (muProc->unk_2c[i]->flags_0))
            {
                return 1;
            }
        }
    }
    else
    {
        struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
        if (muPrimProc->unk_2b >= 0)
        {
            return muPrimProc->flags_0;
        }
    }

    return 0;
}
