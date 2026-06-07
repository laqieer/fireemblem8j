#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"






u16 GetEfxSoundType1FromTerrain(u16 terrain)
{
    int ret;

    if (GetBattleAnimArenaFlag() == true)
        return 0;

    switch (terrain) {
    case TERRAIN_PLAINS:
    case TERRAIN_ROAD:
    case TERRAIN_VILLAGE_REGULAR:
    case TERRAIN_VILLAGE_CLOSED:
    case TERRAIN_HOUSE:
    case TERRAIN_FORT:
    case TERRAIN_MOUNTAIN:
    case TERRAIN_FENCE_REGULAR:
    case TERRAIN_WALL_REGULAR:
    case TERRAIN_WALL_DAMAGED:
    case TERRAIN_RUBBLE:
    case TERRAIN_ROOF:
    case TERRAIN_GATE_REGULAR:
    case TERRAIN_RUINS_REGULAR:
    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
    case TERRAIN_SHIP_WRECK:
    case TERRAIN_GLACIER:
    case TERRAIN_SNAG:
    case TERRAIN_INN:
    case TERRAIN_BARREL:
    case TERRAIN_BRACE:
    case TERRAIN_MAST:
        ret = 0;
        break;

    case TERRAIN_FOREST:
    case TERRAIN_THICKET:
        ret = 1;
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        ret = 2;
        break;

    case TERRAIN_PEAK:
    case TERRAIN_CLIFF:
    case TERRAIN_SHIP_FLAT:
    case TERRAIN_BONE:
    case TERRAIN_DARK:
    case TERRAIN_GUNNELS:
        ret = 3;
        break;

    case TERRAIN_SAND:
    case TERRAIN_DESERT:
        ret = 4;
        break;

    case TERRAIN_BRIDGE_REGULAR:
    case TERRAIN_BRIDGE_14:
        ret = 5;
        break;

    case TERRAIN_ARMORY:
    case TERRAIN_VENDOR:
    case TERRAIN_ARENA_REGULAR:
    case TERRAIN_C_ROOM_09:
    case TERRAIN_GATE_CASTLE:
    case TERRAIN_FLOOR_REGULAR:
    case TERRAIN_FLOOR_MAGIC:
    case TERRAIN_PILLAR:
    case TERRAIN_DOOR:
    case TERRAIN_THRONE:
    case TERRAIN_CHEST_EMPTY:
    case TERRAIN_CHEST_FULL:
    case TERRAIN_CHURCH:
    case TERRAIN_STAIRS:
    case TERRAIN_ARENA_30:
    case TERRAIN_VALLEY:
    case TERRAIN_FENCE_32:
    case TERRAIN_RUINS_VILLAGE:
    case TERRAIN_DECK:
        ret = 6;
        break;

    case TERRAIN_NONE:
    default:
        ret = 0;
        break;
    }
    return ret;
}
