#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapMuEntry2[];

//! FE8U = 0x080C0210
s8 GmMuEntryExists(void)
{
    return Proc_Find(gProcScr_GmapMuEntry2) ? 1 : 0;
}
