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

bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe);
void DrawSoundRoomSongTitle(int index);

//! FE8U = 0x080AF140
bool SoundRoom_StartNextSong_Negative(struct SoundRoomProc * proc)
{
    u8 idx;

    for (idx = (proc->currentSongIdx - 1) & 0x7f;; idx = (idx - 1), idx &= 0x7f)
    {
        if (!(((*(proc->flags + (idx >> 5))) >> (idx & 0x1f)) & 1))
        {
            continue;
        }

        if (StartSoundRoomSong(proc, idx, 0x20))
        {
            DrawSoundRoomSongTitle(proc->currentSongIdx);
            return TRUE;
        }

        return FALSE;
    }
}
