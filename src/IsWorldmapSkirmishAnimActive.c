#include "global.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapTmConfront[];

//! FE8U = 0x080C081C
bool IsWorldmapSkirmishAnimActive(void)
{
    return Proc_Find(ProcScr_GmapTmConfront) ? TRUE : FALSE;
}
