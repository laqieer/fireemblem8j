#include "global.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "worldmap.h"

//! FE8U = 0x080C3EDC
void GMapBaseMenu_StartItemScreen(struct GMapBaseMenuProc * proc)
{
    proc->wasBgmPlaying = IsBgmPlaying();

    if (proc->wasBgmPlaying != 0)
    {
        proc->bgmSongId = GetCurrentBgmSong();
    }

    StartPrepItemScreen(proc);

    return;
}
