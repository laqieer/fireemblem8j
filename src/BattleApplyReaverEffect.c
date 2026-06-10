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

void BattleApplyReaverEffect(struct BattleUnit* attacker, struct BattleUnit* defender) {
    if (!(attacker->weaponAttributes & IA_REVERTTRIANGLE) || !(defender->weaponAttributes & IA_REVERTTRIANGLE)) {
        attacker->wTriangleHitBonus = -(attacker->wTriangleHitBonus * 2);
        attacker->wTriangleDmgBonus = -(attacker->wTriangleDmgBonus * 2);
        defender->wTriangleHitBonus = -(defender->wTriangleHitBonus * 2);
        defender->wTriangleDmgBonus = -(defender->wTriangleDmgBonus * 2);
    }
}
