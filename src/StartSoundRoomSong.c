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

//! FE8U = 0x080AF7F4
bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe)
{
    if (MusicProc4Exists())
    {
        return FALSE;
    }

    proc->currentSongIdx = index;
    proc->currentSongTime = 1;
    ChangeBgm(gSoundRoomTable[index].bgmId, 0x100, 0x100, flagsMaybe, NULL);

    return TRUE;
}
