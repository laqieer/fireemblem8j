#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "uiutils.h"

extern const u16* sUiFrameModelTilemapLookup[];

void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    u16 tilemapOffset;
    s8 r9;
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;
    int iy, ix;

    if (style != 3)
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX2(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX2(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = model[7]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, y)]    = model[2]; // top center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, y)]    = model[2]; // top centertile

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX2(x+0, y+0)] = model[0]; // top left tile (0, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+1, y+0)] = model[1]; // top left tile (1, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+0, y+1)] = model[4]; // top left tile (0, 1)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+1, y+1)] = model[5]; // top left tile (1, 1)

        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, y)]    = model[3];  // top right tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = model[15]; // bottom right tile
    }
    else
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            r9 = (iy == y + 1);

            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX2(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 5 : 9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 6 : 10];

                tilemapOffset += TILEMAP_INDEX2(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = model[r9 ? 4 : 8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = model[r9 ? 7 : 11]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = model[15]; // bottom right tile
    }

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}
