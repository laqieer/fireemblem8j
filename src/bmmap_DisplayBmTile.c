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

extern EWRAM_DATA u8** gBmMapFog;

extern u16 sTilesetConfig[];

void DisplayBmTile(u16* bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap) {
    u16* out = bg + yTileMap * 0x40 + xTileMap * 2;
    u16* tile = sTilesetConfig + gBmMapBaseTiles[yBmMap][xBmMap];

    /* TODO: palette id constants */
    u16 base = gBmMapFog[yBmMap][xBmMap] ? (6 << 12) : (11 << 12);

    out[0x00 + 0] = base + *tile++;
    out[0x00 + 1] = base + *tile++;
    out[0x20 + 0] = base + *tile++;
    out[0x20 + 1] = base + *tile++;
}
