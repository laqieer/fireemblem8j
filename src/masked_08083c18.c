#include "global.h"
#include "bmunit.h"
#include "ap.h"
#include "mu.h"
#include "bm.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "bmmap.h"
#include "bmio.h"
#include "bmudisp.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void RegisterMapHpChangeAnim(int mapst_id, int damage)
{
    int hp_cur = gManimSt.actor[mapst_id].hp_cur;

    if (hp_cur <= damage)
        gManimSt.actor[mapst_id].hp_cur = 0;
    else
        gManimSt.actor[mapst_id].hp_cur = hp_cur - damage;

    if (gManimSt.actor[mapst_id].hp_cur > gManimSt.actor[mapst_id].hp_max)
        gManimSt.actor[mapst_id].hp_cur = gManimSt.actor[mapst_id].hp_max;
}
