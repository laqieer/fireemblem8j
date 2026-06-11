#include "global.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "worldmap.h"

//! FE8U = 0x080C3F04
void GMapBaseMenu_RestoreBgm(struct GMapBaseMenuProc * proc)
{
    if (proc->wasBgmPlaying != 0)
    {
        StartBgmFadeIn(proc->bgmSongId, 1, 0);
    }

    return;
}
