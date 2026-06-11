#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "bmsave.h"
#include "ap.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080AEB28
void FadeOutBgm(int unk)
{
    ChangeBgm(SONG_NONE, 0x100, 0, unk, NULL);
    return;
}
