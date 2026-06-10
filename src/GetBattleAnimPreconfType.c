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

int GetBattleAnimPreconfType(void) {

    // If not solo anim, return global type
    if (gPlaySt.config.animationType != PLAY_ANIMCONF_SOLO_ANIM)
        return gPlaySt.config.animationType;

    // If both units are players, use actor solo anim type
    if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
        if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)
            return GetSoloAnimPreconfType(&gBattleActor.unit);

    // If neither are players, return 1
    if (UNIT_FACTION(&gBattleActor.unit) != FACTION_BLUE)
        if (UNIT_FACTION(&gBattleTarget.unit) != FACTION_BLUE)
            return PLAY_ANIMCONF_OFF;

    // Return solo anim type for the one that is a player unit
    if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
        return GetSoloAnimPreconfType(&gBattleActor.unit);
    else
        return GetSoloAnimPreconfType(&gBattleTarget.unit);
}
