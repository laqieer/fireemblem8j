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
extern u16 * gSpriteArray_MusicPlayer_TimeNumbers[];
extern u16 gSprite_MusicPlayer_Colon[];
extern u16 gSprite_MusicPlayer_Time[];

// clang-format on

//! FE8U = 0x080B0240
void DrawMusicPlayerTime(int x, int y, int time)
{
    int seconds = time / 60;
    int minutes = seconds / 60;
    int secondsIntoMin = seconds % 60;

    PutSpriteExt(0, x, y, gSprite_MusicPlayer_Time, OAM2_PAL(4));
    PutSpriteExt(0, x + 40, y, gSpriteArray_MusicPlayer_TimeNumbers[minutes], OAM2_PAL(4));
    PutSpriteExt(0, x + 48, y, gSprite_MusicPlayer_Colon, OAM2_PAL(4));

    if (secondsIntoMin >= 10)
    {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin / 10], OAM2_PAL(4));
    }
    else
    {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[0], OAM2_PAL(4));
    }

    PutSpriteExt(0, x + 64, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin % 10], OAM2_PAL(4));

    return;
}
