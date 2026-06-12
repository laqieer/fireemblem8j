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

int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu) {
    int i, result;

    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return -1;

    if (bu->unit.curHP == 0)
        return -1;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return -1;

    if (gBmSt.gameStateBits & 0x40) // TODO: GAME STATE BITS CONSTANTS
        return -1;

    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA)) {
        if (!bu->canCounter)
            return -1;

        if (!(bu->weaponAttributes & IA_REQUIRES_WEXP))
            return -1;

        if (bu->weaponAttributes & (IA_MAGICDAMAGE | IA_LOCK_3))
            return -1;
    }

    result = bu->unit.ranks[bu->weaponType];
    result += GetItemAwardedExp(bu->weapon) * bu->wexpMultiplier;

    for (i = 0; i < 8; ++i) {
        if (i == bu->weaponType)
            continue;

        if (bu->unit.pClassData->baseRanks[i] == WPN_EXP_S)
            continue;

        if (bu->unit.ranks[i] < WPN_EXP_S)
            continue;

        if (result >= WPN_EXP_S)
            result = (WPN_EXP_S - 1);

        break;
    }

    if (UNIT_CATTRIBUTES(&bu->unit) & CA_PROMOTED) {
        if (result > WPN_EXP_S)
            result = WPN_EXP_S;
    } else if (UNIT_CATTRIBUTES(&bu->unit) & CA_MAXLEVEL10) {
        if (result > WPN_EXP_C)
            result = WPN_EXP_C;
    } else {
        if (result > WPN_EXP_A)
            result = WPN_EXP_A;
    }

    return result;
}
