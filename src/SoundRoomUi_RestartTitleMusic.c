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

//! FE8U = 0x080AFA64
void SoundRoomUi_RestartTitleMusic(struct SoundRoomProc * proc)
{
    if (!MusicProc4Exists())
    {
        ChangeBgm(SONG_MAIN_THEME, 0, 0xc0, 0x18, 0);
        Proc_Break(proc);
    }

    return;
}
