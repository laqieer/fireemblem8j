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

//! FE8U = 0x080BB48C
ProcPtr GetGmapUnitFade(void)
{
    return Proc_Find(ProcScr_GmapUnitFade);
}
