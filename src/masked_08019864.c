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






EWRAM_DATA u8** gBmMapMovement = NULL;
EWRAM_DATA u8** gBmMapRange    = NULL;



















/* prototypes for same-file helpers called by this run */
void Nop_Bmmap_0(void);

void DisplayMovementViewTile(u16* bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap) {
    bg = bg + 2*(yTileMap * 0x20 + xTileMap);

    if (!bg)
        Nop_Bmmap_0();

    // TODO: tile macros?
    // TODO: are the movement and range maps s8[][]?

    if (gMapMovementSigned[yBmMap][xBmMap] >= 0) {
        bg[0x00 + 0] = 0x4280;
        bg[0x00 + 1] = 0x4281;
        bg[0x20 + 0] = 0x4282;
        bg[0x20 + 1] = 0x4283;

        return;
    }

    if (gMapRangeSigned[yBmMap][xBmMap]) {
        if (bg[0]) {
            bg[0x00 + 0] = 0x5284;
            bg[0x00 + 1] = 0x5285;
            bg[0x20 + 0] = 0x5286;
            bg[0x20 + 1] = 0x5287;

            return;
        } else {
            bg[0x00 + 0] = 0x5280;
            bg[0x00 + 1] = 0x5281;
            bg[0x20 + 0] = 0x5282;
            bg[0x20 + 1] = 0x5283;

            return;
        }
    }

    bg[0x00 + 0] = 0;
    bg[0x00 + 1] = 0;
    bg[0x20 + 0] = 0;
    bg[0x20 + 1] = 0;
}
