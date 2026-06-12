#include "global.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapBaseMenu[];

//! FE8U = 0x080C4038
void EndGMapBaseMenu(void)
{
    Proc_EndEach(ProcScr_GmapBaseMenu);
    return;
}
