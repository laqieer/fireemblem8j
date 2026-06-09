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






int EfxCheckRetaliation(int is_retaliation)
{
    int ret;
    struct BattleHit * hit = gBattleHitArray;

    if (hit->info & BATTLE_HIT_INFO_RETALIATION)
        ret = true;
    else
        ret = false;

    if (is_retaliation == ret)
        return true;

    return false;
}
