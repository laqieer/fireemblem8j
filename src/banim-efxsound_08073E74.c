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

void EfxPlaySE(int songid, int volume)
{
    struct ProcEfxSoundSE * proc;

    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    if (CheckEfxSoundSeExist() == 0)
    {
        RegisterEfxSoundSeExist();
        Sound_SetBGMVolume(volume);
        PlaySoundEffect(songid);
        return;
    }

    proc = Proc_Start(ProcScr_efxSoundSE, PROC_TREE_3);
    proc->volume = volume;
    proc->index = songid;
    proc->timer = 0;
}
