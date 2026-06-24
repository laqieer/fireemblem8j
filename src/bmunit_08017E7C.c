#include "global.h"

#include <string.h>

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"

void UnitAutolevelRealistic(struct Unit* unit) {
    struct BattleUnit tmpBattleUnit;
    short levelsLeft;


    levelsLeft = (unit->level - unit->pCharacterData->baseLevel);

    if (levelsLeft) {
        for (unit->level -= levelsLeft; levelsLeft > 0; --levelsLeft) {
            InitBattleUnit(&tmpBattleUnit, unit);

            tmpBattleUnit.unit.exp += 100;
            CheckBattleUnitLevelUp(&tmpBattleUnit);

            UpdateUnitFromBattle(unit, &tmpBattleUnit);
        }
    }
}
