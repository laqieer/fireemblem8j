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

void InitObstacleBattleUnit(void) {
    ClearUnit(&gBattleTarget.unit);

    gBattleTarget.unit.index = 0;

    gBattleTarget.unit.pClassData = GetClassData(CLASS_OBSTACLE);

    gBattleTarget.unit.maxHP = GetROMChapterStruct(gPlaySt.chapterIndex)->mapCrackedWallHeath;
    gBattleTarget.unit.curHP = gActionData.trapType; // TODO: better

    gBattleTarget.unit.xPos  = gActionData.xOther;
    gBattleTarget.unit.yPos  = gActionData.yOther;

    switch (gBmMapTerrain[gBattleTarget.unit.yPos][gBattleTarget.unit.xPos]) {

    case TERRAIN_WALL_DAMAGED:
        gBattleTarget.unit.pCharacterData = GetCharacterData(CHARACTER_WALL);

        break;

    case TERRAIN_SNAG:
        gBattleTarget.unit.pCharacterData = GetCharacterData(CHARACTER_SNAG);
        gBattleTarget.unit.maxHP = 20;

        break;

    } // switch (gBmMapTerrain[gBattleTarget.unit.yPos][gBattleTarget.unit.xPos])
}
