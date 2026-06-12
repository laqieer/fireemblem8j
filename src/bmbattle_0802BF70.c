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

void BattleApplyUnitUpdates(void) {
    struct Unit* actor  = GetUnit(gBattleActor.unit.index);
    struct Unit* target = GetUnit(gBattleTarget.unit.index);

    if (gBattleActor.canCounter)
        gBattleActor.unit.items[gBattleActor.weaponSlotIndex] = gBattleActor.weapon;

    if (gBattleTarget.canCounter)
        gBattleTarget.unit.items[gBattleTarget.weaponSlotIndex] = gBattleTarget.weapon;

    UpdateUnitFromBattle(actor, &gBattleActor);

    if (target)
        UpdateUnitFromBattle(target, &gBattleTarget);
    else
        UpdateObstacleFromBattle(&gBattleTarget);
}
