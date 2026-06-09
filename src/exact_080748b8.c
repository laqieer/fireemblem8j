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






u16 GetEfxSoundType2FromBaseCon(u16 basecon)
{
    int ret = 0;
    if (basecon >= 5)
    {
        if (basecon <= 8)
            ret = 1;
        else if (basecon <= 0xB)
            ret = 2;
        else if (basecon <= 0xF)
            ret = 3;
    }
    return ret;
}
