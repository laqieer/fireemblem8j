#include "global.h"
#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

int GetTrueTerrainAt(int x, int y) {
    return gTilesetTerrainLookup[gBmMapBaseTiles[y][x] >> 2];
}
