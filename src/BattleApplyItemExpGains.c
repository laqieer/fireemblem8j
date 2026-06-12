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

void BattleApplyItemExpGains(void) {
    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)) {
        if (gBattleActor.weaponAttributes & IA_STAFF) {
            if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
                gBattleActor.wexpMultiplier++;

            gBattleActor.expGain = GetBattleUnitStaffExp(&gBattleActor);
            gBattleActor.unit.exp += gBattleActor.expGain;

            CheckBattleUnitLevelUp(&gBattleActor);
        } else if ((gBattleActor.weaponType == ITYPE_DANCE) && (gBattleActor.unit.exp != UNIT_EXP_DISABLED)) {
            gBattleActor.expGain = 20;
            gBattleActor.unit.exp += 20;

            CheckBattleUnitLevelUp(&gBattleActor);
        }
    }
}
