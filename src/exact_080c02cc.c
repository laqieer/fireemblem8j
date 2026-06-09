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
ProcPtr GetGmapUnitFade(void);

//! FE8U = 0x080BB49C
void GmapUnitFade_AddUnit(int index)
{
    struct GMapUnitFadeProc * proc = GetGmapUnitFade();

    if (proc)
    {
        proc->unk_30[proc->unk_37] = index;
        proc->unk_37++;
    }

    return;
}
