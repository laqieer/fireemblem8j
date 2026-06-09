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






int GetBanimBossBGM(struct Unit * unit)
{
    int i, pid = UNIT_CHAR_ID(unit);
    for (i = 0; gBanimBossBGMs[i] != -1; i = i + 2)
    {
        if (pid == gBanimBossBGMs[i])
            break;
    }
    return gBanimBossBGMs[i + 1];
}
