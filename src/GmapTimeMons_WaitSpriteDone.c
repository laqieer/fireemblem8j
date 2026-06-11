#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

void GmapTimeMons_WaitSpriteDone(struct ProcGmapTimeMons * proc)
{
    if (!APProc_Exists())
        Proc_Break(proc);
}
