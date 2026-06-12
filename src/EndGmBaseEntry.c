#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapBaseEntry[];

//! FE8U = 0x080BFB24
void EndGmBaseEntry(void)
{
    Proc_EndEach(gProcScr_GmapBaseEntry);
    return;
}
