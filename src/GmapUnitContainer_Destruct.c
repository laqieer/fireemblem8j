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

//! FE8U = 0x080BB1A0
void GmapUnitContainer_Destruct(struct GMapUnitContainerProc * proc)
{
    int i;

    struct GMapUnitProc ** r4 = proc->pMapUnitProcs;
    struct GMapUnitProc ** r6 = proc->pMapUnitProcs;

    for (i = 0; i < 7; r4++, i++)
    {
        if (r6 == NULL)
        {
            continue;
        }

        Proc_End(*r4);
        *r4 = NULL;
    }

    return;
}
