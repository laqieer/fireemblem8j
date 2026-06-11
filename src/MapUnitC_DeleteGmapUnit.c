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

//! FE8U = 0x080BAF0C
void MapUnitC_DeleteGmapUnit(struct GMapUnitContainerProc * container, int index)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    if (mapUnitProc != NULL)
    {
        AP_Delete(mapUnitProc->ap);
        mapUnitProc->ap = NULL;
        Proc_End(mapUnitProc);
        container->pMapUnitProcs[index] = NULL;
    }

    return;
}
