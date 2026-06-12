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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapUnitFade[];

//! FE8U = 0x080BB47C
void EndGmapUnitFade(void)
{
    Proc_EndEach(ProcScr_GmapUnitFade);
    return;
}
