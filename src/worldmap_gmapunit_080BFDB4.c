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

//! FE8U = 0x080BAF84
void MapUnitC_SetAnimId(struct GMapUnitContainerProc * container, int index, int animId)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    mapUnitProc->animId = animId;
    AP_SwitchAnimation(mapUnitProc->ap, mapUnitProc->animId);

    return;
}
