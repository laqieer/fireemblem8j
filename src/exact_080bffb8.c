#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

//! FE8U = 0x080BB188
u16 MapUnitC_GetInitialClass(struct GMapUnitContainerProc * container, int index)
{
    return container->pMapUnitProcs[index]->unk_38;
}

//! FE8U = 0x080BB194
int MapUnitC_GetDisplayedClass(struct GMapUnitContainerProc * container, int index)
{
    return container->pMapUnitProcs[index]->unk_3a;
}
