#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void EfxOverrideBgm(int songid, int volume)
{
    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    Sound_SetSEVolume(volume);
    OverrideBgm(songid);
}

void StopBGM1(void)
{
    m4aMPlayStop(&gMPlayInfo_BGM1);
}

void UnregisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = false;
}

void RegisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = true;
}

int CheckEfxSoundSeExist(void)
{
    return gEfxSoundSeExist;
}

void M4aPlayWithPostionCtrl(int songid, int x, int flag)
{
    int pan;

    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    if (flag != 0)
    {
        struct MusicPlayerInfo * info;
        if (x <= 0x77)
            pan = Div(x * x, 0x78) - 0x78;
        else
            pan = 0x78 - Div((0xF0 - x) * (0xF0 - x), 0x78);

        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        m4aMPlayPanpotControl(info, 0xFFFF, pan);
    }
    else
    {
        struct MusicPlayerInfo * info;
        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        m4aMPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
    }
}
