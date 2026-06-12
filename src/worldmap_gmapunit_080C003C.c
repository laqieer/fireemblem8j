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

/* prototypes for same-file helpers called by this run */
void MapUnitC_SetDisplayEnabled(struct GMapUnitContainerProc * container, int index, s8 flag);
void MapUnitC_SetFaction(struct GMapUnitContainerProc * container, int index, int faction);

//! FE8U = 0x080BB20C
void GmapUnitFade_Destruct(struct GMapUnitFadeProc * proc)
{
    int i;

    for (i = 0; i < proc->unk_37; i++)
    {
        if (proc->unk_2a < 0)
        {
            MapUnitC_SetDisplayEnabled(GM_UNITC, proc->unk_30[i], 0);
        }

        MapUnitC_SetFaction(GM_UNITC, proc->unk_30[i], -1);
    }

    return;
}
