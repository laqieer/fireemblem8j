#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

void ClearBlankBgTiles(void)
{
    if (gLCDControlBuffer.bg0cnt.colorMode == 0)
        Memset16((u16 *) (VRAM + GetBackgroundTileDataOffset(0)), 0x10, 0);

    if (gLCDControlBuffer.bg1cnt.colorMode == 0)
        Memset16((u16 *) (VRAM + GetBackgroundTileDataOffset(1)), 0x10, 0);

    if (gLCDControlBuffer.bg2cnt.colorMode == 0)
        Memset16((u16 *) (VRAM + GetBackgroundTileDataOffset(2)), 0x10, 0);

    if (gLCDControlBuffer.bg3cnt.colorMode == 0)
        Memset16((u16 *) (VRAM + GetBackgroundTileDataOffset(3)), 0x10, 0);
}

int Screen2Pan(int x)
{
    if (x < 0)
        return -0x60;

    if (x >= DISPLAY_WIDTH)
        return +0x5F;

    return Div(0xC0 * x, DISPLAY_WIDTH) - 0x60;
}

void PlaySeSpacial(int song, int x)
{
    struct MusicPlayerInfo * info;

    PlaySoundEffect(song);

    info = gMPlayTable[gSongTable[song].ms].info;

    m4aMPlayImmInit(info);
    m4aMPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
}

void PlaySeDelayed(int song, int delay)
{
    CallDelayedArg(PlaySeFunc, song, delay);
}

void PlaySeFunc(int song)
{
    PlaySoundEffect(song);
}

void _StartBgm(short song)
{
    StartBgm(song, NULL);
}
