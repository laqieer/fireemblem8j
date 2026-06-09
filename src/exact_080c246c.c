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





//! FE8U = 0x080BD660
int GmMuPrim_GetFacingFromAngle(u16 a)
{
    if ((u16)(a + 0x4d00) < 0x1a00)
    {
        return 3;
    }

    if (a < 0x3300 || a >= 0x4d00)
    {
        return (u16)(a - 0x4000) >> 0xf;
    }

    return 2;
}
