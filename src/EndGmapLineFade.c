#include "global.h"
#include "hardware.h"
#include "spline.h"
#include "sysutil.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapLineFade[];

//! FE8U = 0x080C0520
void EndGmapLineFade(void)
{
    Proc_EndEach(ProcScr_GmapLineFade);
    return;
}
