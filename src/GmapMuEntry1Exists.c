#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapMuEntry1[];

//! FE8U = 0x080BFD10
s8 GmapMuEntry1Exists(void)
{
    return Proc_Find(gProcScr_GmapMuEntry1) ? 1 : 0;
}
