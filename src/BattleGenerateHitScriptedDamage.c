#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

void BattleGenerateHitScriptedDamage(struct BattleUnit* bu) {
    gBattleStats.damage = 0;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        if (gBattleHitIterator->hpChange == 0) {
            gBattleStats.damage = gBattleStats.attack - gBattleStats.defense;

            if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_CRIT)
                gBattleStats.damage = 3 * gBattleStats.damage;
        } else
            gBattleStats.damage = gBattleHitIterator->hpChange;

        if (gBattleStats.damage > BATTLE_MAX_DAMAGE)
            gBattleStats.damage = BATTLE_MAX_DAMAGE;

        if (gBattleStats.damage < 0)
            gBattleStats.damage = 0;

        if (gBattleStats.damage != 0)
            bu->nonZeroDamage = TRUE;
    }
}
