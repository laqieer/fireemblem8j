#include "global.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080C07B8
void GmTmConfront_WaitForAnim(ProcPtr proc)
{
    if (!APProc_Exists())
    {
        Proc_Break(proc);
    }

    return;
}
