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
 void BmMapInit(void* buffer, u8*** outHandle, int width, int height);

 void RenderBmMapColumn(u16 xOffset);
 void RenderBmMapLine(u16 yOffset);

 void RefreshUnitsOnBmMap(void);
 void RefreshTorchlightsOnBmMap(void);
 void RefreshMinesOnBmMap(void);



enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this (overlaps with a lot of other objects?)


EWRAM_DATA struct Vec2 gBmMapSize = {};



























void BmMapFillEdges(u8** map, u8 value) {
    int ix, iy;

    u8** theMap = map;

    // Set tile values for horizontal edges
    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        theMap[iy][0]              = value;
        theMap[iy][gBmMapSize.x-1] = value;
    }

    // Set tile values for vertical edges
    for (ix = 0; ix < gBmMapSize.x; ++ix) {
        theMap[0]             [ix] = value;
        theMap[gBmMapSize.y-1][ix] = value;
    }
}
