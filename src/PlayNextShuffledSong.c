#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_SoundRoomSongChange[];
extern s8 * gSoundRoomShuffleBuffer;

// clang-format on

//! FE8U = 0x080AEF24
void PlayNextShuffledSong(struct SoundRoomProc * proc)
{
    Proc_Start(gProcScr_SoundRoomSongChange, proc);

    proc->shuffleIndex++;

    if ((gSoundRoomShuffleBuffer[proc->shuffleIndex] == -1) || (proc->shuffleIndex == 0x80))
    {
        proc->shuffleIndex = 0;
    }

    return;
}
