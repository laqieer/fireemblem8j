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

int GetUnitRoundExp(struct Unit* actor, struct Unit* target) {
    int expLevel;

    expLevel = GetUnitExpLevel(actor);
    expLevel = expLevel - GetUnitExpLevel(target);
    expLevel = 31 - expLevel;

    if (expLevel < 0)
        expLevel = 0;

    return expLevel / actor->pClassData->classRelativePower;
}

int GetUnitPowerLevel(struct Unit* unit) {
    int result = unit->level * unit->pClassData->classRelativePower;

    if ((UNIT_CATTRIBUTES(unit) & CA_PROMOTED) && unit->pClassData->promotion)
        result = result + 20 * GetClassData(unit->pClassData->promotion)->classRelativePower;

    return result;
}
