#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapEffect[];
extern struct ProcCmd gProcScr_GmapEffectPal[];

//! FE8U = 0x080C128C
void GmapEffect_OnEnd(void)
{
    if (CountProcs(gProcScr_GmapEffect) < 2)
    {
        Proc_EndEach(gProcScr_GmapEffectPal);
    }

    return;
}
